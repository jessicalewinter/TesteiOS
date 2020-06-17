//
//  WebViewCoordinator.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

protocol WebViewFlow: AnyObject {
    func dismissWebView()
}

class WebViewCoordinator: Coordinator {
    let navigationController: UINavigationController
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let webViewController = WebViewController()
        webViewController.coordinator = self
        webViewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(webViewController, animated: true)
    }
}

extension WebViewCoordinator: WebViewFlow {
    func dismissWebView() {
        navigationController.popViewController(animated: true)
    }
    
}
