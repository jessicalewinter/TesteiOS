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
    weak var delegateHeight: ContactViewDelegate?
    
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
    
    lazy var checkBox: CheckboxView = {
        let view = CheckboxView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton(with: .action, and: .buttonPressed)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ablubleble", for: .normal)
        return button
    }()
        
    init() {
        super.init(frame: .zero)
        setupView()
        bindtoViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDelegate() {
        delegateHeight?.getTopAnchor(constraint: nameField.bottomAnchor)
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
            phoneField,
            checkBox,
            sendButton
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
        
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
        
        NSLayoutConstraint.activate([
           checkBox.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 50),
           checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
           checkBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
           checkBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
           sendButton.topAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: 30),
           sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
           sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
           sendButton.heightAnchor.constraint(equalToConstant: 50)
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
            var count = 0
            for (index, textField) in self.textFields.enumerated() {
                count = index + 1
                self.setTitle(textField: textField, text: self.viewModel.cells[count].message)
            }
            self.checkBox.checkLabel.text = self.viewModel.form?.cells[count+1].message
            self.sendButton.setTitle(self.viewModel.cells[count+2].message, for: .normal)
        }
    }
}
