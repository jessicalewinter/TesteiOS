//
//  Form.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//
// swiftlint:disable identifier_name

import Foundation

struct Form: Decodable {
    let cells: [Cell]?
}

struct Cell: Decodable {
    let id: Int
    let type: Int
    let message: String
    let typeField: Int?
}
