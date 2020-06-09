//
//  Registrable.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

protocol Registrable {
    associatedtype CellType
    
    func registerCell(_ cellClass: CellType.Type)
}
