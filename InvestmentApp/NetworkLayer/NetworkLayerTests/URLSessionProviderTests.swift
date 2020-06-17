//
//  URLSessionProviderTests.swift
//  NetworkLayerTests
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import XCTest
@testable import NetworkLayer

class URLSessionProviderTests: XCTestCase {
    var dataTask: URLSessionDataTaskMock!
    var session: URLSessionMock!
    var provider: URLSessionProvider!
    var service: ServiceMock!
    
    override func setUp() {
        dataTask = URLSessionDataTaskMock()
        session = URLSessionMock(dataTask: dataTask)
        provider = URLSessionProvider(session: session)
        service = ServiceMock.getAll
    }
    
    override func tearDown() {
        dataTask = nil
        session = nil
        provider = nil
        service = nil
    }
    
    func testGetResumeCalled() {
        let expectation = XCTestExpectation(description: "Waiting for result")
        
        provider.request(type: ModelMock.self, service: service) { (_) in
            expectation.fulfill()
            return
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testGetResultSuccess() {
        let expectation = XCTestExpectation(description: "Waiting for result")
        
        provider.request(type: ModelMock.self, service: service) { [weak self] (result) in
            guard let self = self else { return }
            print("\n\n\(self.dataTask.resumeWasCalled)\n\n")
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let model):
                print(model)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testGetResultWrongModel() {
        let expectation = XCTestExpectation(description: "Waiting for result")
        
        provider.request(type: WrongModelMock.self, service: service) { [weak self] (result) in
            guard let self = self else { return }
            print("\n\n\(self.dataTask.resumeWasCalled)\n\n")
            
            switch result {
            case .failure(let error):
                print(error)
                expectation.fulfill()
            case .success(let model):
                print(model)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testReceivedFailedHTTPResponse() {
        let expectation = XCTestExpectation(description: "Waiting for result")
        
        session.response = session.createResponse(statusCode: 400)
        provider.request(type: ModelMock.self, service: service) { [weak self] (result) in
            guard let self = self else { return }
            print("\n\n\(self.dataTask.resumeWasCalled)\n\n")
            
            switch result {
            case .failure(let error):
                print(error)
                expectation.fulfill()
            case .success(let model):
                print(model)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
