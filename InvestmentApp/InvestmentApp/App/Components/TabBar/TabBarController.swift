//
//  TabBarController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var coordinator: Coordinator?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.invalidateIntrinsicContentSize()
        self.selectedImage(with: .tabBarSelected)
    }
}
