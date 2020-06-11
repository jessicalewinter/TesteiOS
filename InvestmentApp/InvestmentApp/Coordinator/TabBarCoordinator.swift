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
        let tabBarController = TabBarController(withShadow: true)
        tabBarController.coordinator = self
        
        let investmentNavigationController = UINavigationController()
        investmentNavigationController.tabBarItem = UITabBarItem(title: "Investment", image: nil, tag: 0)
        let investmentCoordinator = InvestmentCoordinator(navigationController: investmentNavigationController)
        
        let contactNavigationController = UINavigationController()
        contactNavigationController.tabBarItem = UITabBarItem(title: "contact", image: nil, tag: 1)
        let contactCoordinator = ContactCoordinator(navigationController: contactNavigationController)
        
        tabBarController.viewControllers = [investmentNavigationController, contactNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        coordinate(to: investmentCoordinator)
        coordinate(to: contactCoordinator)
    }
    
}
