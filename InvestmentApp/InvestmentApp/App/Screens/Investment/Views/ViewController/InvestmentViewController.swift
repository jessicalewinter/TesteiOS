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
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = investmentView
    }

}
