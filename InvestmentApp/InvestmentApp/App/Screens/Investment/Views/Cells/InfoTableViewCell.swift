//
//  InfoTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .placeholder)
        return label
    }()
    
    lazy var dataLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .darkText)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            nameLabel,
            dataLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
