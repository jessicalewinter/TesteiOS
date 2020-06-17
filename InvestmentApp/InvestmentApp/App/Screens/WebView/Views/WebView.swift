//
//  WebView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit
import WebKit

class WebView: UIView {
    weak var delegateHeight: ContactViewDelegate?
    var flag: Bool = false
    var timer: Timer?
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    lazy var loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = .action
        return view
    }()
    
    func startLoading() {
        progressView.progress = 0.0
        flag = false
        timer = Timer.scheduledTimer(timeInterval: 0.01667, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }

    func finishLoading() {
        flag = true
    }

    @objc func timerCallback() {
        if flag {
            if progressView.progress >= 1 {
                progressView.isHidden = true
                timer?.invalidate()
            } else {
                progressView.progress += 0.1
            }
        } else {
            progressView.progress += 0.05
            if self.progressView.progress >= 0.95 {
                self.progressView.progress = 0.95
            }
        }
    }
    
    func getDelegate() {
        delegateHeight?.getTopAnchor(constraint: progressView.topAnchor)
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        finishLoading()
    }
}

extension WebView: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            webView,
            progressView
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        webView.navigationDelegate = self
        webView.load("https://www.google.com")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
