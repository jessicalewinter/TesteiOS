//
//  UITextField+fixCaretPosition.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UITextField {
    /// Moves the caret to the correct position by removing the trailing whitespace
    func fixCaretPosition() {
        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
}
