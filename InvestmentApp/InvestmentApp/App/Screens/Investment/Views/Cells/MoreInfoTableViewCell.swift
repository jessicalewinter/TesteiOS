//
//  MoreInfoTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    lazy var moreInfoLabel: UILabel = {
        let label = UILabel(with: UIFont.normalMediumTitle, and: .lightText)
        label.textAlignment = .left
        return label
    }()
    
    lazy var detailFundLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .placeholder)
        label.text = "Fundo"
        return label
    }()
    
    lazy var detailCDILabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .placeholder)
        label.text = "CDI"
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

extension MoreInfoTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            moreInfoLabel,
             detailFundLabel,
             detailCDILabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            moreInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            moreInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            moreInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailFundLabel.topAnchor.constraint(equalTo: moreInfoLabel.bottomAnchor, constant: 20),
            detailFundLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            detailCDILabel.topAnchor.constraint(equalTo: moreInfoLabel.bottomAnchor, constant: 20),
            detailCDILabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailCDILabel.leadingAnchor.constraint(equalTo: detailFundLabel.trailingAnchor, constant: 30),
            detailCDILabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
