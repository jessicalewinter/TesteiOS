//
//  AppCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let initialCoordinator = InitialCoordinator(navigationController: navigationController)
        coordinate(to: initialCoordinator)
    }
    
    
}
