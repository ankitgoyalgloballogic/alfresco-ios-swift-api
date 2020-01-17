//
//  RefreshTokenPresenter.swift
//  AlfrescoAuth
//
//  Created by Florin Baincescu on 13/09/2019.
//  Copyright © 2019 Alfresco. All rights reserved.
//

import Foundation
import AlfrescoCore

class RefreshTokenPresenter: NSObject, NetworkServiceProtocol {
    var authDelegate: AlfrescoAuthDelegate? = nil
    var apiClient: APIClientProtocol
    var configuration: AuthConfiguration
    
    init(configuration: AuthConfiguration) {
        self.configuration = configuration
        self.apiClient = APIClient(with: configuration.baseUrl)
    }
    
    func executeRefresh(_ credential: AlfrescoCredential) {
        requestToken(with: credential) { [weak self] (result) in
            guard let sSelf = self else { return } 
            DispatchQueue.main.async {
                sSelf.authDelegate?.didReceive(result: result)
            }
        }
    }
    
    func requestToken(with credential: AlfrescoCredential, completion: @escaping (Result<AlfrescoCredential, APIError>) -> Void) {
        if let refreshToken = credential.refreshToken {
            _ = apiClient.send(GetAlfrescoCredential(refreshToken: refreshToken, configuration: configuration), completion: { (result) in
                completion(result)
            })
        } else {
            completion(.failure(APIError(domain: Bundle.main.bundleName ?? "AlfrescoAuth", code: ModuleErrorType.errorRefreshTokenNil.code, message: errorRefreshTokenNil)))
        }
    }
}
