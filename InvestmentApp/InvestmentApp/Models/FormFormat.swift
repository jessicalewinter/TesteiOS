//
//  FormFormat.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

struct FormFormat: Decodable {
    let cells: [Cell]?
}

struct Cell: Decodable {
    let id: Int
    let type: Int
    let message: String
    let typeField: Int?
}
