//
//  InvestButtonTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InvestButtonTableViewCell: UITableViewCell {
    var openWebView: (() -> Void)?
    
    lazy var investButton: UIButton = {
        let button = UIButton(with: .action, and: .buttonPressed)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Investir", for: .normal)
        button.addTarget(self, action: #selector(pushToWebView), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pushToWebView () {
        openWebView?()
        print("hello its me")
    }
    
}

extension InvestButtonTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubview(investButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            investButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            investButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            investButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            investButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            investButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
