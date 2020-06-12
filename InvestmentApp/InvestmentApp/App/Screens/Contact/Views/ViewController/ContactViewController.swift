//
//  ContactViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactViewController: DefaultViewController, UITextFieldDelegate {
    let lightGreyColor: UIColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
    let darkGreyColor: UIColor = UIColor(red: 52 / 255, green: 42 / 255, blue: 61 / 255, alpha: 1.0)
    let overcastBlueColor: UIColor = UIColor(red: 0, green: 187 / 255, blue: 204 / 255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Contato"
        // Do any additional setup after loading the view.
        createTextField()
    }
    
    func createTextField() {
        let textField = FloatingTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        textField.delegate = self
        
        textField.becomeFirstResponder()
        textField.placeholder = "Nome"
        textField.selectedTitle = "Nome"
        textField.title = "Nome"
        
        textField.tintColor = UIColor.placeholder

        textField.textColor = UIColor.darkText
        textField.lineColor = UIColor.placeholder

        textField.selectedTitleColor = UIColor.placeholder
        textField.selectedLineColor = UIColor.line

        // Set custom fonts for the title, placeholder and textfield labels
        textField.titleLabel.font = UIFont.subtitleForm
        textField.placeholderFont = UIFont.titleForm
        textField.font = UIFont.textForm
    }

}
