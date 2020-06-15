//
//  ContactViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactViewController: DefaultViewController, UITextFieldDelegate {
    lazy var contactView: ContactView = {
        let view = ContactView()
        view.delegateHeight = self
        view.alertDelegate = self
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contato"
        contactView.getDelegate()
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    override func loadView() {
        view = contactView
    }
    
}
extension ContactViewController: ContactViewDelegate {
    func getAnchor(constraint: NSLayoutYAxisAnchor) {
        let height = UIApplication.shared.statusBarFrame.height +
        self.navigationController!.navigationBar.frame.height
        topLayoutGuide.bottomAnchor.constraint(equalTo: constraint, constant: -height).isActive = true
    }
}

extension ContactViewController: AlertDelegate {
    func showAlert() {
        defaultAlert("Erro: campos inválidos", message: "Não foi possível enviar os dados, pois há campos inválidos. Tente novamente.", actionTitle: "OK", completion: nil)
    }
}
