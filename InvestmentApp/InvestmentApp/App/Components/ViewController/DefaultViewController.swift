//
//  DefaultViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.normalMediumTitle!,
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
    }
}
extension DefaultViewController: ContactViewDelegate {
    func getTopAnchor(constraint: NSLayoutYAxisAnchor) {
        let height = self.navigationController!.navigationBar.frame.height
        topLayoutGuide.bottomAnchor.constraint(equalTo: constraint, constant: -height).isActive = true
    }
}
