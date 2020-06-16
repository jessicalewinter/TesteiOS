//
//  InvestmentViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InvestmentViewController: DefaultViewController, UITextFieldDelegate {
    
    lazy var investmentView: InvestmentView = {
        let view = InvestmentView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investimento"
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        shareButton.tintColor = .action
        navigationItem.rightBarButtonItem = shareButton
        let viewzinha = RiskView()
        viewzinha.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(viewzinha)
//        NSLayoutConstraint.activate([
//            viewzinha.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            viewzinha.centerYAnchor.constraint(equalTo: view.centerYAnchor),
////            viewzinha.heightAnchor.constraint(equalToConstant: 100),
//            viewzinha.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
//        ])
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = investmentView
    }

}
