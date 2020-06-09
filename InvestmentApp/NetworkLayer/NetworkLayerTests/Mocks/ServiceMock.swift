//
//  ServiceMock.swift
//  NetworkLayerTests
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation
@testable import NetworkLayer

enum ServiceMock {
    case getAll
}

extension ServiceMock: Service {
    var baseURL: URL {
        switch self {
        case .getAll:
            return URL(string: "https://www.mockurl.com")!
        }
    }
    
    var path: String {
        switch self {
        case .getAll:
            return "fakepath"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAll:
            return .requestPlain
        }
    }
    
    var headers: Headers? {
        switch self {
        case .getAll:
            return nil
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .getAll:
            return .url
        }
    }
    
}

