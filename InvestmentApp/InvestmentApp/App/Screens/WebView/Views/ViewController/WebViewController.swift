//
//  WebViewController.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: DefaultViewController {
    var coordinator: WebViewFlow?
    
    lazy var webView: WebView = {
        let view = WebView()
        view.delegateHeight = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBar = UIBarButtonItem(title: "Fechar", style: .done, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = rightBar
        webView.getDelegate()
    }
    
    @objc func dismissView() {
        coordinator?.dismissWebView()
    }
    
    override func loadView() {
        view = webView
    }
}
