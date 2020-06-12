//
//  FloatingTextField+convenienceInit.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 12/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension FloatingTextField {
    convenience init(with title: String) {
        self.init()
        self.autocorrectionType = .no
        
        self.placeholder = title
        self.selectedTitle = title
        self.title = title
        
        self.tintColor = UIColor.placeholder
        self.textColor = UIColor.darkText
        self.lineColor = UIColor.placeholder

        self.selectedTitleColor = UIColor.placeholder
        self.selectedLineColor = UIColor.line

        // Set custom fonts for the title, placeholder and textfield labels
        self.titleLabel.font = UIFont.subtitleForm
        self.placeholderFont = UIFont.titleForm
        self.font = UIFont.textForm
    }
}
