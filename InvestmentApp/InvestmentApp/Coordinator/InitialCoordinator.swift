//
//  InitialCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol InitialFlow {
    func coordinateToTab()
}

class InitialCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let tabBar = 
    }
    
}
