//
//  ContactDetailCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 13/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol ContactDetailFlow: AnyObject {
    func dismissDetail()
}

class ContactDetailCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.contactDetailView.coordinator = self
//        contactDetailViewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(contactDetailViewController, animated: true)
    }
}

extension ContactDetailCoordinator: ContactDetailFlow {
    func dismissDetail() {
        navigationController.popViewController(animated: true)
    }
    
}
