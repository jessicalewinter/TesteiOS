//
//  Dequeuable.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol Dequeuable {
    associatedtype CellType
    
    func dequeueReusableCell() -> CellType
    func dequeueReusableCell(for indexPath: IndexPath) -> CellType
}
