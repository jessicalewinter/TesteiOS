//
//  UIFont+customFonts.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

enum FontSizes: CGFloat {
    case smallestSize = 11
    case smallSize = 14
    case normalSize = 16
    case largeSize = 18
    case titleSize = 28
    
}

extension UIFont {
    static let smallMediumTitle = UIFont(name: "DINPro-Medium", size: FontSizes.smallSize.rawValue)
    static let mediumTitle = UIFont(name: "DINPro-Medium", size: FontSizes.titleSize.rawValue)
    static let normalMediumTitle = UIFont(name: "DINPro-Medium", size: FontSizes.normalSize.rawValue)
    static let normalRegularTitle = UIFont(name: "DINPro-Regular", size: FontSizes.normalSize.rawValue)
    static let normalLightTitle = UIFont(name: "DINPro-Light", size: FontSizes.normalSize.rawValue)
    static let table = UIFont(name: "DINPro-Regular", size: FontSizes.smallSize.rawValue)
    static let smallestRegularTitle = UIFont(name: "DINPro-Regular", size: FontSizes.smallestSize.rawValue)
    static let largeMediumTitle = UIFont(name: "DINPro-Medium", size: FontSizes.largeSize.rawValue)
}
