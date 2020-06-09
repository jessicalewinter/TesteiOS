//
//  URLSessionMock.swift
//  NetworkLayerTests
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation
@testable import NetworkLayer

class URLSessionMock: URLSessionProtocol {
    var dataTask: URLSessionDataTaskProtocol
    lazy var response: HTTPURLResponse = createResponse(statusCode: 200)
    
    init(dataTask: URLSessionDataTaskProtocol) {
        self.dataTask = dataTask
    }
    
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTaskProtocol {
        result(.success((response, loadJson(withTitle: "result"))))
        
        return dataTask
    }
    
    private func loadJson(withTitle title: String) -> Data {
        var data = Data()
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: title, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return data
    }
    
    func createResponse(statusCode: Int) -> HTTPURLResponse {
        guard let url = URL(string: "https://www.mockurl.com") else {
            fatalError("URL can't be empty")
        }
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        
        return response
    }
}
