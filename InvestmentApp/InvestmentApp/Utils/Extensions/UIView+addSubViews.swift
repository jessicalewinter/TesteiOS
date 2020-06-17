//
//  UIView+addSubViews.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach { (view) in
            addSubview(view)
        }
    }
}
