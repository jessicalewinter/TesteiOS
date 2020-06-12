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
    
    lazy var textFields: [FloatingTextField] = {
        let textFields = [nameField, emailField, phoneField]
        return textFields
    }()
    
    lazy var nameField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        return floatingTextField
    }()
    
    lazy var emailField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        return floatingTextField
    }()
    
    lazy var phoneField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        return floatingTextField
    }()
    
    var getTopHeight: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupView()
        bindtoViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(textField: FloatingTextField, text: String) {
        textField.placeholder = text
        textField.selectedTitle = text
        textField.title = text
    }
}

extension ContactView: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            nameField,
            emailField,
            phoneField
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
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
           phoneField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
           phoneField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
           phoneField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
       ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

extension ContactView: Bindable {
    func bindtoViewModel() {
        viewModel.getForm()
        
        viewModel.needReloadForms = { [weak self] in
            guard let self = self else {return}
            
            for (index, textField) in self.textFields.enumerated() {
                self.setTitle(textField: textField, text: (self.viewModel.form?.cells[index+1].message)!)
            }
            
        }
    }
}
