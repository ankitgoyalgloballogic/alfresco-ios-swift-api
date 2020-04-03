//
//  AuthWebPresenterTests.swift
//  AlfrescoAuthTests
//
//  Created by Silviu Odobescu on 02/08/2019.
//  Copyright © 2019 Alfresco. All rights reserved.
//

import Foundation
import XCTest
import WebKit
import AlfrescoCore
@testable import AlfrescoAuth

class AuthWebPresenterTests: XCTestCase {
    var sut: AuthWebPresenter!
    var navigationActionStub: WKNavigationActionStub!
    var expectationForDidReceivedCall = XCTestExpectation(description: "Wait for delegate.")
    var expectationForSuccessInDidReceivedCall = XCTestExpectation(description: "Success in DidReceivedCall")
    var expectationForFailureInDidReceivedCall = XCTestExpectation(description: "Failure in DidReceivedCall")
    
    override func setUp() {
        super.setUp()
        sut = AuthWebPresenter(configuration: TestData.configuration)
        navigationActionStub = WKNavigationActionStub()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInitWithConfiguration() {
        sut = AuthWebPresenter(configuration: TestData.configuration)
        XCTAssertEqual(sut.configuration, TestData.configuration)
    }
    
    func testSutParseReturnWKNavigationActionPolicyCancel() {
        let apiClientSub = APIClientStub(with: TestData.baseUrlGood, session: URLSession(configuration: .default))
        sut.apiClient = apiClientSub
        navigationActionStub.sendCodeUrl = true
        
        let actionPolicy = sut.parse(action: navigationActionStub)
        XCTAssertEqual(actionPolicy, WKNavigationActionPolicy.cancel)
    }
    
    func testSutParseReturnWKNavigationActionPolicyAllow() {
        navigationActionStub.sendCodeUrl = false
        let actionPolicy = sut.parse(action: navigationActionStub)
        XCTAssertEqual(actionPolicy, WKNavigationActionPolicy.allow)
    }
    
    func testSutParseCallsWithSuccess() {
        let apiClientSub = APIClientStub(with: TestData.baseUrlGood, session: URLSession(configuration: .default))
        let delegateStub = AlfrescoAuthDelegateStub()
        
        delegateStub.expectationForDidReceivedCall = expectationForDidReceivedCall
        delegateStub.expectationForSuccessInDidReceivedCall = expectationForSuccessInDidReceivedCall
        apiClientSub.responseType = .validCredential
        sut.apiClient = apiClientSub
        navigationActionStub.sendCodeUrl = true
        sut.authDelegate = delegateStub
        
        _ = sut.parse(action: navigationActionStub)
        wait(for: [expectationForDidReceivedCall, expectationForSuccessInDidReceivedCall], timeout: 10.0)
    }
    
    func testSutParseCallsWithFailure() {
        let apiClientSub = APIClientStub(with: TestData.baseUrlGood, session: URLSession(configuration: .default))
        let delegateStub = AlfrescoAuthDelegateStub()
        
        delegateStub.expectationForDidReceivedCall = expectationForDidReceivedCall
        delegateStub.expectationForFailureInDidReceivedCall = expectationForFailureInDidReceivedCall
        apiClientSub.responseType = .error
        sut.apiClient = apiClientSub
        navigationActionStub.sendCodeUrl = true
        sut.authDelegate = delegateStub
        
        _ = sut.parse(action: navigationActionStub)
        wait(for: [expectationForDidReceivedCall, expectationForFailureInDidReceivedCall], timeout: 10.0)
    }
    
    func testRequestTokenWithSuccess() {
        let apiClientSub = APIClientStub(with: TestData.baseUrlGood, session: URLSession(configuration: .default))
        apiClientSub.responseType = .validCredential
        sut.apiClient = apiClientSub
        sut.requestToken(with: TestData.codeGood) { (result) in
            var success = false
            switch result {
            case .success(_):
                success = true
            case .failure(_):
                success = false
            }
            XCTAssertTrue(success)
        }
    }
    
    func testRequestTokenWithFailure() {
        let apiClientSub = APIClientStub(with: TestData.baseUrlGood, session: URLSession(configuration: .default))
        apiClientSub.responseType = .error
        sut.apiClient = apiClientSub
        sut.requestToken(with: TestData.codeGood) { (result) in
            var success = false
            switch result {
            case .success(_):
                success = true
            case .failure(_):
                success = false
            }
            XCTAssertFalse(success)
        }
    }
    
    func testSutWKNavigationDelegateNavigationAction() {
           let webViewMock = WebViewMock()
           webViewMock.navigationDelegate = sut
           webViewMock.navigationDelegate?.webView?(webViewMock, decidePolicyFor: navigationActionStub, decisionHandler: { (actionPolicy) in
               XCTAssertNotNil(actionPolicy)
           })
       }
}