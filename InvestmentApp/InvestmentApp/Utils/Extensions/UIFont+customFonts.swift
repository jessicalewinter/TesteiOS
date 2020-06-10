//
//  UIFont+customFonts.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

enum FontSizes: CGFloat {
    case smallSize = 14
    case normalSize = 16
    case titleSize = 28
    
}

extension UIFont {
    static let firstTitle = UIFont(name: "DINPro-Medium", size: FontSizes.smallSize.rawValue)
    static let secondTitle = UIFont(name: "DINPro-Medium", size: FontSizes.titleSize.rawValue)
    static let secondDescri = UIFont(name: "DINPro-Medium", size: FontSizes.normalSize.rawValue)
    static let table = UIFont(name: "DINPro-Regular", size: FontSizes.smallSize.rawValue)
}
