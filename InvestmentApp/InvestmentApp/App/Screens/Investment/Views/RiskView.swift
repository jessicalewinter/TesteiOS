//
//  RiskView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class RiskView: UIView {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 3
        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stack
    }()
    
    func createRiskView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        view.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        view.backgroundColor = color
        return view
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var riskViews: [UIView] {
        let views = [createRiskView(color: .risk1), createRiskView(color: .risk2), createRiskView(color: .risk3), createRiskView(color: .risk4), createRiskView(color: .risk5)]
        return views
    }
}

extension RiskView: ViewCodable {
    func buildViewHierarchy() {
        for view in riskViews {
            stackView.addArrangedSubview(view)
        }
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
