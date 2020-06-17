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
    weak var alertDelegate: AlertDelegate?
    var coordinator: ContactFlow?
    var activeTextField: UITextField?
    
    lazy var textFields: [FloatingTextField] = {
        let textFields = [nameField, emailField, phoneField]
        return textFields
    }()
    
    lazy var nameField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        floatingTextField.delegate = self
        floatingTextField.becomeFirstResponder()
        floatingTextField.keyboardType = .default
        return floatingTextField
    }()
    
    lazy var emailField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        floatingTextField.delegate = self
        floatingTextField.keyboardType = .emailAddress
        return floatingTextField
    }()
    
    lazy var phoneField: FloatingTextField = {
        let floatingTextField = FloatingTextField(with: "title")
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        floatingTextField.delegate = self
        floatingTextField.keyboardType = .numberPad
        floatingTextField.inputAccessoryView = toolBar
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
        button.addTarget(self, action: #selector(pushToDetails), for: .touchUpInside)
        return button
    }()
    
    lazy var toolBar: UIToolbar = {
        let doneToolbar: UIToolbar = UIToolbar(with: "Ok", and: #selector(closePad), with: self)
        return doneToolbar
    }()
    
    @objc func closePad() {
        verifyValidate()
        phoneField.resignFirstResponder()
    }
        
    init() {
        super.init(frame: .zero)
        setupView()
        bindtoViewModel()
        dismiss()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func getDelegate() {
        delegateHeight?.getTopAnchor(constraint: nameField.topAnchor)
    }
    
    func setTitle(textField: FloatingTextField, text: String) {
        textField.placeholder = text
        textField.selectedTitle = text
        textField.title = text
    }
    
    @objc func pushToDetails() {
        var flag = false
        for textField in textFields {
            if textField.text == "" {
                flag = true
            } else if textField.errorMessage != nil {
                flag = true
            } else {
                flag = false
            }
        }
        
        if flag {
            alertDelegate?.showAlert()
        } else {
            coordinator?.coordinateToDetail()
        }
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
        
        viewModel.needReloadItems = { [weak self] in
            guard let self = self else {return}
            var count = 0
            for (index, textField) in self.textFields.enumerated() {
                count = index + 1
                self.setTitle(textField: textField, text: self.viewModel.cells[count].message)
            }
            self.checkBox.checkLabel.text = self.viewModel.cells[count+1].message
            self.sendButton.setTitle(self.viewModel.cells[count+2].message, for: .normal)
        }
    }
}

extension ContactView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneField {
            var fullString = textField.text ?? ""
            fullString.append(string)
            if range.length == 1 {
                textField.text = MaskText.format(phoneNumber: fullString, shouldRemoveLastDigit: true)
            } else {
                textField.text = MaskText.format(phoneNumber: fullString)
            }
            return false
        }
        return true
    }
    
    func verifyValidate() {
        if activeTextField == emailField {
            validateTextFieldWithText(textField: emailField, type: .email)
        } else if activeTextField == phoneField {
            validateTextFieldWithText(textField: phoneField, type: .phone)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Validate the email field
        if textField == emailField {
            validateTextFieldWithText(textField: emailField, type: .email)
        } else if textField == phoneField {
            validateTextFieldWithText(textField: phoneField, type: .phone)
        }
                
        // When pressing return, move to the next field
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func validateTextFieldWithText(textField: FloatingTextField, type: FormType) {
        guard let text = textField.text else {
           textField.errorMessage = nil
           return
        }

        if text.isEmpty {
           textField.errorMessage = nil
        } else if !ValidationForm.validate(text, type: type) {
            textField.errorMessage = type.errorMessage
        } else {
           textField.errorMessage = nil
        }
    }
    
    func dismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        verifyValidate()
        endEditing(true)
    }
}
