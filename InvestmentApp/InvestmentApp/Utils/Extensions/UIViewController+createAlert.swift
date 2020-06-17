//
//  UIViewController+createAlert.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit
 
extension UIViewController {
    func defaultAlert(_ title: String?, message: String?, actionTitle: String?, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: completion))
        present(alert, animated: true, completion: nil)
    }
}
