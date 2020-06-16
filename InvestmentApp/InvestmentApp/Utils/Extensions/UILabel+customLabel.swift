//
//  UILabel+customLabel.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(with fontType: UIFont?, and color: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textAlignment = .center
        font = fontType
        textColor = color
        text = "ablubleble"
    }
}
