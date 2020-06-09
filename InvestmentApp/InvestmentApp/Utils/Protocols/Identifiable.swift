//
//  Identifiable.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var reuseIdentifer: String { get }
}

extension Identifiable {
    static var reuseIdentifer: String {
        String(describing: Self.self)
    }
}

extension UITableViewCell: Identifiable {}
