//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case noJSONData
    case unknown
    case decodeError(String)
    case clientError(statusCode: Int, dataResponse: String)
    case serverError(statusCode: Int, dataResponse: String)
}
