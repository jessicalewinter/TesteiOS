//
//  URLSessionProtocol.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

public protocol URLSessionProtocol {
    func dataTask(with url: URLRequest, result:
        @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTaskProtocol
}
