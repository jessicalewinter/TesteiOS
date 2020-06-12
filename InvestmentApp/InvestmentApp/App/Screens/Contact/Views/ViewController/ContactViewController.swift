//
//  ContactViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactViewController: DefaultViewController, UITextFieldDelegate {
    
    let contactView = ContactView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Contato"
        // Do any additional setup after loading the view.
        //        textField.delegate = self
        //
        //        textField.becomeFirstResponder()
    }
    
    override func loadView() {
        view = contactView
    }

}
