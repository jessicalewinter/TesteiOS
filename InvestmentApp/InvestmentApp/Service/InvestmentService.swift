//
//  InvestmentService.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation
import NetworkLayer

enum InvestmentService {
    case getForm
    case getFunds
}

extension InvestmentService: Service {
    var baseURL: URL {
        switch self {
        case .getForm, .getFunds:
            return URL(string: "https://floating-mountain-50292.herokuapp.com/")!
        }
    }
    
    var path: String {
        switch self {
        case .getForm:
            return "cells.json"
        case .getFunds:
            return "fund.json"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getForm, .getFunds:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getForm, .getFunds:
            return .requestPlain
        }
    }
    
    var headers: Headers? {
        switch self {
        case .getForm, .getFunds:
            return nil
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .getForm, .getFunds:
            return .url
        }
    }
}
