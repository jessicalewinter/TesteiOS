//
//  LoadingView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .whiteLarge
        indicator.color = .white
        return indicator
    }()
    
    lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carregando..."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.normalMediumTitle
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(activityIndicator)
        containerView.addSubview(loadingLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 200),
            containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -20),
            activityIndicator.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5),
            activityIndicator.heightAnchor.constraint(equalTo: activityIndicator.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 32),
            loadingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loadingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
}
