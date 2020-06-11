//
//  TabBarCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {

    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let investmentNavigationController = UINavigationController()
        investmentNavigationController.tabBarItem = UITabBarItem(title: "Investimento", image: nil, tag: 0)
        let investmentCoordinator = InvestmentCoordinator(navigationController: investmentNavigationController)
        
        let contactNavigationController = UINavigationController()
        contactNavigationController.tabBarItem = UITabBarItem(title: "Contato", image: nil, tag: 1)
        let contactCoordinator = ContactCoordinator(navigationController: contactNavigationController)
        
        tabBarController.viewControllers = [investmentNavigationController, contactNavigationController]
        
        tabBarController.modalPresentationStyle = .overFullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)
        
        coordinate(to: investmentCoordinator)
        coordinate(to: contactCoordinator)
    }
    
}
