//
//  ContactView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 12/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactView: UIView {
    var viewModel = ContactFormViewModel()
    
    func createCustomTextField(textField: FloatingTextField, title: String) {
        textField.autocorrectionType = .no
        
        textField.placeholder = title
        textField.selectedTitle = title
        textField.title = title
        
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
    
    lazy var nameField: FloatingTextField = {
        let floatingTextField = FloatingTextField()
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        createCustomTextField(textField: floatingTextField, title: "Nome")
        return floatingTextField
    }()
    
    lazy var contactField: FloatingTextField = {
        let floatingTextField = FloatingTextField()
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        createCustomTextField(textField: floatingTextField, title: "Contact")
        return floatingTextField
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        bindtoViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactView: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            nameField,
            contactField
        ])
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                nameField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
                nameField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
                nameField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
            ])
        } else {
            // Fallback on earlier versions
        }
        
        NSLayoutConstraint.activate([
            contactField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            contactField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            contactField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

extension ContactView: Bindable {
    func bindtoViewModel() {
        
    }
}
