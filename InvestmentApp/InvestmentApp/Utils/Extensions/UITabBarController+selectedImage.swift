//
//  UITabBarController+selectedImage.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//  

import UIKit

extension UITabBarController {
    func selectedImage(with color: UIColor) {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .action
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false

        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.normalMediumTitle!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .normal)
        
        // set red as selected background color
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.bounds.width / numberOfItems, height: tabBar.bounds.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: color, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)

        // remove default border
        tabBar.bounds.size.width = self.view.bounds.width + 4
        
    }
}
