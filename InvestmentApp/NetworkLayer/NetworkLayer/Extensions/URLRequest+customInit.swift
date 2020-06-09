//
//  URLRequest+customInit.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

extension URLRequest {
    
    /// A URL request that is builded from the service's specifications
    /// - Parameter service: The object that specify the needed information to make an http request
    
     init(service: Service) {
       if let urlComponents = URLComponents(service: service),
           let url = urlComponents.url {
           self.init(url: url)

           self.httpMethod = service.method.rawValue

           service.headers?.forEach { key, value in
               addValue(value, forHTTPHeaderField: key)
           }

           guard case let .requestWithBody(payload) = service.task,
               service.parametersEncoding == .json else {
                   return
           }

           if let payloadEncoded = payload.asData() {
               self.httpBody = payloadEncoded
           }
       } else {
           self.init(url: URL(fileURLWithPath: ""))
       }
   }
}
