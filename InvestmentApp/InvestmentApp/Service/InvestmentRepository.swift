//
//  InvestmentRepository.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation
import NetworkLayer

public class InvestmentRepository: NetworkRepository {
    
    static func getForm(completion: @escaping ((Result<Form, Error>) -> Void)) {
        let sessionProvider = URLSessionProvider()
        sessionProvider.request(type: Form.self, service: InvestmentService.getForm) { (result) in
            switch result {
            case .success(let form):
                completion(.success(form))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getFund(completion: @escaping ((Result<Fund, Error>) -> Void)) {
        let sessionProvider = URLSessionProvider()
        sessionProvider.request(type: Fund.self, service: InvestmentService.getFunds) { (result) in
            switch result {
            case .success(let fund):
                completion(.success(fund))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
