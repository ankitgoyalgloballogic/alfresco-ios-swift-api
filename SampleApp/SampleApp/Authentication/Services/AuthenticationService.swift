//
// Copyright (C) 2005-2020 Alfresco Software Limited.
//
// This file is part of the Alfresco Content Mobile iOS App.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import AlfrescoAuth

protocol AuthenticationServiceProtocol {
    /// Parameters used as part of the login flow process
    var parameters: AuthenticationParameters { get }

    init(with authenticationParameters: AuthenticationParameters)

    /// Overrides the existing parameters used to create a session with new ones.
    /// - Parameter authenticationParameters: Authentication parameters such as hostname, port etc.
    func update(authenticationParameters: AuthenticationParameters)

    /// Returns via a closure the available authentication method for the given authentication parameters.
    /// - Parameter handler:Authentication type available
    func availableAuthType(handler: @escaping AvailableAuthTypeCallback<AvailableAuthType>)

    /// Initiates a login session with AIMS.
    /// - Parameters:
    ///   - viewController: View controller where the AIMS webview component will be displayed over
    ///   - delegate: Authentication delegate
    func aimsAuthentication(on viewController: UIViewController, delegate: AlfrescoAuthDelegate)

    /// Initiates a login with basic authentication.
    /// - Parameters:
    ///   - credentials: Credential object containing the username and password
    ///   - handler: Signals the success or failure of the operation with additional error information
    func basicAuthentication(with credentials: BasicAuthCredential, handler: @escaping ((Result<Bool, APIError>) -> Void))
}

public typealias AvailableAuthTypeCallback<AuthType> = (Result<AuthType, APIError>) -> Void

class AuthenticationService: AuthenticationServiceProtocol {
    private (set) var parameters: AuthenticationParameters
    private (set) lazy var alfrescoAuth: AlfrescoAuth = {
        let authConfig = parameters.authenticationConfiguration()
        return AlfrescoAuth.init(configuration: authConfig)
    }()

    var session: AlfrescoAuthSession?
    var apiClient: APIClientProtocol?

    required init(with authenticationParameters: AuthenticationParameters) {
        self.parameters = authenticationParameters
    }

    func update(authenticationParameters: AuthenticationParameters) {
        self.parameters = authenticationParameters
    }

    func availableAuthType(handler: @escaping AvailableAuthTypeCallback<AvailableAuthType>) {
        let authConfig = parameters.authenticationConfiguration()
        alfrescoAuth.update(configuration: authConfig)
        alfrescoAuth.availableAuthType(handler: handler)
    }

    func aimsAuthentication(on viewController: UIViewController, delegate: AlfrescoAuthDelegate) {
        let authConfig = parameters.authenticationConfiguration()
        alfrescoAuth.update(configuration: authConfig)
        alfrescoAuth.pkceAuth(onViewController: viewController, delegate: delegate)
    }

    func basicAuthentication(with credentials: BasicAuthCredential, handler: @escaping ((Result<Bool, APIError>) -> Void)) {
        let basicAuthCredentialProvider = BasicAuthenticationProvider(with: credentials)

        apiClient = APIClient(with: String(format: "%@/%@/", parameters.fullHostnameURL, parameters.serviceDocument))
        _ = apiClient?.send(GetContentServicesProfile(with: basicAuthCredentialProvider), completion: { (result) in
            switch result {
            case .success(_):
                handler(.success(true))
            case .failure(let error):
                handler(.failure(error))
            }
        })
    }

    func logOut(onViewController viewController: UIViewController, lastKnownCredential: AlfrescoCredential, delegate: AlfrescoAuthDelegate) {
        alfrescoAuth.logout(onViewController: viewController, delegate: delegate, forCredential: lastKnownCredential)
    }

    func refreshSession(delegate: AlfrescoAuthDelegate) {
        if let session = self.session {
            alfrescoAuth.pkceRefresh(session: session, delegate: delegate)
        }
    }

    func saveAuthParameters() {
        parameters.save()
    }

    func resumeExternalUserAgentFlow(with url: URL) -> Bool {
        if session == nil {
            session = AlfrescoAuthSession()
        }
        guard let authSession = session else { return false}
        return authSession.resumeExternalUserAgentFlow(with: url)
    }
}
