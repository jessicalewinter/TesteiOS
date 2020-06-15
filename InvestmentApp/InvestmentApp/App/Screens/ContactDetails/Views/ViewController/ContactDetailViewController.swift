//
//  ContactDetailViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 13/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactDetailViewController: DefaultViewController {
    lazy var contactDetailView: ContactDetailView = {
        let view = ContactDetailView()
        view.backgroundColor = .white
        view.delegateHeight = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Contato"
        contactDetailView.getDelegate()
    }
    
    override func loadView() {
        view = contactDetailView
    }
}

extension ContactDetailViewController: ContactViewDelegate {
    func getAnchor(constraint: NSLayoutYAxisAnchor) {
        guard let height = tabBarController?.tabBar.frame.size.height else { return }
        bottomLayoutGuide.bottomAnchor.constraint(equalTo: constraint, constant: height + 60).isActive = true
    }
}
