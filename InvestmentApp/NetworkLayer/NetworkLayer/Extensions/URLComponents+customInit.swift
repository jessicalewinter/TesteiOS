//
//  URLComponents+customInit.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

extension URLComponents {
    
    /// Build the URL that conforms to the service that receives as parameter
    /// - Parameter service: The object that specify the information needed to do a request
    
    init?(service: Service) {
        let url = service.baseURL.appendingPathComponent(service.path)
        self.init(url: url, resolvingAgainstBaseURL: false)
        
        guard case let .requestParameters(parameters) = service.task,
            service.parametersEncoding == .url else { return }
        
        queryItems = parameters.map({ (key, value) in
            return URLQueryItem(name: key, value: String(describing: value))
        })
    }
}
