//
//  Provider.swift
//  NetworkLayer
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

public final class URLSessionProvider: Provider {
    
    public var session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public func request<T: Decodable>(type: T.Type, service: Service, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let request = URLRequest(service: service)
        
        let task = session.dataTask(with: request) { (result) in
            self.handleResponse(result: result, completion: completion)
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            task.resume()
        }
    }
    
    public func handleResponse<T: Decodable>(result: Result<(URLResponse, Data), Error>, completion: (Result<T, NetworkError>) -> Void) {
        
        switch result {
        case .failure(let error):
            print("Error: \(error)")
            completion(.failure(.unknown))
        case .success((let response, let data)):
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.noJSONData))
                return
            }
            
            guard let dataString = String(bytes: data, encoding: .utf8) else {
                print("Could not cast data to string")
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                // Removes the need to use codingkeys on model
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let model = try decoder.decode(T.self, from: data)
                    completion(.success(model))
                } catch let error {
                    completion(.failure(.decodeError(error.localizedDescription)))
                }
            case 400...499:
                completion(.failure(.clientError(statusCode: statusCode, dataResponse: dataString)))
            case 500...599:
                completion(.failure(.serverError(statusCode: statusCode, dataResponse: dataString)))
            default:
                completion(.failure(.unknown))
            }
        }
    }
}
