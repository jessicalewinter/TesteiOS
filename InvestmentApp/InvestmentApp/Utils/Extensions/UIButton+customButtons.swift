//
//  UIButton+customButtons.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 13/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIButton {
    func changeColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
    
    convenience init(with color: UIColor, and highlighted: UIColor) {
        self.init()
        backgroundColor = color
        layer.cornerRadius = 22
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        titleLabel?.font = UIFont.normalMediumTitle
        setTitleColor(.white, for: .normal)
        changeColor(color: highlighted, forState: .highlighted)
    }
}
