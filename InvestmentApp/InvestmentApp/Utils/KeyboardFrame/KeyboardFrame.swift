//
//  KeyboardFrame.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class KeyboardFrame {
    weak var view: UIView?
    var currentTextField: UITextField?
    
    init(view: UIView, and textField: UITextField?) {
        self.view = view
        self.currentTextField = textField
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

   @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
         return
        }

        var shouldMoveViewUp = false

        // if active text field is not nil
        if let activeTextField = currentTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let topOfKeyboard = self.view?.frame.height ?? 0 - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }

        if shouldMoveViewUp {
            self.view?.frame.origin.y = 0 - keyboardSize.height
        }
   }
   
   @objc func keyboardWillHide(notification: NSNotification) {
     // move back the root view origin to zero
    self.view?.frame.origin.y = 0
   }
}
