//
//  Task.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
    case requestWithBody(Encodable)
}
