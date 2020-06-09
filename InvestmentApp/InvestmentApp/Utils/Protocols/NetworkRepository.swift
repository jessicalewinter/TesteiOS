//
//  NetworkRepository.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

protocol NetworkRepository {
    static func getForm(completion: @escaping ((Result<FormFormat, Error>) -> Void))
    static func getFund(completion: @escaping ((Result<Fund, Error>) -> Void))
}
