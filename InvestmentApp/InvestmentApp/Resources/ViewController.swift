//
//  ViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 04/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit
import NetworkLayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        testNetwork()
    }
    
    func testNetwork() {
        
        InvestmentRepository.getForm { (result) in
            
            switch result {
            case .success(let form):
                print(form)
            case .failure(let error):
                print(error)
            }
        }
        
        print("mama")
    }
    
    func testNetwork2() {
        
        InvestmentRepository.getFund { (result) in
            
            switch result {
            case .success(let form):
                print(form)
            case .failure(let error):
                print(error)
            }
        }
        
        print("mama")
    }
}
