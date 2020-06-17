//
//  UIToolbar+doneButton.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIToolbar {
    convenience init(with text: String, and selector: Selector, with target: Any?) {
        self.init()
        barStyle = .default
        frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: text, style: .done, target: target, action: selector)
        let addItems = [flexSpace, done]
        items = addItems
        sizeToFit()
    }
}
