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

protocol Registrable {
    associatedtype CellType
    
    func registerCell(_ cellClass: CellType.Type)
}

protocol Identifiable {
    static var reuseIdentifier: String { get }
}

extension Identifiable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

extension UITableViewCell: Identifiable {}
