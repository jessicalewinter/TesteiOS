//
//  URLSessionDataTaskMock.swift
//  NetworkLayerTests
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

@testable import NetworkLayer

final class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled: Bool = false
    
    func resume() {
        resumeWasCalled = true
    }
}
