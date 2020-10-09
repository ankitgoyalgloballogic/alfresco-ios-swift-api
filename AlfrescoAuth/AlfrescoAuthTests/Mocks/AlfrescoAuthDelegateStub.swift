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
import AlfrescoCore
import XCTest

class AlfrescoAuthDelegateStub: AlfrescoAuthDelegate {
    var expectationForDidReceivedCall: XCTestExpectation!
    var expectationForSuccessInDidReceivedCall: XCTestExpectation!
    var expectationForFailureInDidReceivedCall: XCTestExpectation!
    
    var expectationForSuccessInDidLogoutCall: XCTestExpectation!
    var expectationForFailureInDidLogoutCall: XCTestExpectation!
    
    func didReceive(result: Result<AlfrescoCredential, APIError>, session: AlfrescoAuthSession?) {
        switch result {
        case .success(_):
            expectationForSuccessInDidReceivedCall.fulfill()
        case .failure(_):
            expectationForFailureInDidReceivedCall.fulfill()
        }
        expectationForDidReceivedCall.fulfill()
    }
    
    func didLogOut(result: Result<Int, APIError>) {
        switch result {
        case .success(_):
            expectationForSuccessInDidLogoutCall.fulfill()
        case .failure(_) :
            expectationForFailureInDidLogoutCall.fulfill()
        }
    }
}
