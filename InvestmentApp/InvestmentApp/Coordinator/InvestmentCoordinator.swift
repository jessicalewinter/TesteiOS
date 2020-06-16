//
//  InvestmentCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 10/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol InvestmentFlow: AnyObject {
    func coordinateToWebView()
}

class InvestmentCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let investmentViewController = InvestmentViewController()
        investmentViewController.investmentView.viewModel.coordinator = self
        navigationController?.pushViewController(investmentViewController, animated: false)
    }
}

extension InvestmentCoordinator: InvestmentFlow {
    func coordinateToWebView() {
        let webViewCoordinator = WebViewCoordinator(navigationController: navigationController!)
        coordinate(to: webViewCoordinator)
    }
}
