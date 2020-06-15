//
//  ContactCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol ContactFlow: AnyObject {
    func coordinateToDetail()
}

class ContactCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let contactViewController = ContactViewController()
        contactViewController.contactView.coordinator = self
        navigationController?.pushViewController(contactViewController, animated: false)
    }
}

extension ContactCoordinator: ContactFlow {
    func coordinateToDetail() {
        let contactDetailsCoordinator = ContactDetailCoordinator(navigationController: navigationController!)
        coordinate(to: contactDetailsCoordinator)
    }
}
