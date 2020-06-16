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
    
    lazy var webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBar = UIBarButtonItem(title: "Fechar", style: .done, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = rightBar
        webView.load("https://www.google.com")
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(Float(webView.estimatedProgress))
        }
    }
    
    @objc func dismissView() {
        coordinator?.dismissWebView()
    }
    
    override func loadView() {
        view = webView
    }
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
