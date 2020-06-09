//
//  Provider.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

public protocol Provider {
    func request<T: Decodable>(type: T.Type, service: Service, completion: @escaping (Result<T, NetworkError>) -> Void)
}
