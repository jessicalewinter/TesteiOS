//
//  UITabBarController+customInit.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UITabBarController {
    convenience init(withShadow: Bool) {
        self.init()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.tintColor = .red
        self.tabBar.tintColor = UIColor.white
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.normalTitle!], for: .normal)
        
        if withShadow {
            self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
            self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            self.tabBar.layer.shadowRadius = 10
            self.tabBar.layer.shadowOpacity = 1
            self.tabBar.layer.masksToBounds = false
        }
        
    }
}
