//
//  MoreInfoPeriodTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class MoreInfoPeriodTableViewCell: UITableViewCell {
    lazy var periodLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .placeholder)
        label.text = "Periodo"
        label.textAlignment = .left
        return label
    }()
    
    lazy var fundLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .darkText)
        label.text = "Fundo"
        label.textAlignment = .right
        return label
    }()
    
    lazy var cdiLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .darkText)
        label.text = "CDI"
        label.textAlignment = .right
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

extension MoreInfoPeriodTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            periodLabel,
            fundLabel,
            cdiLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            periodLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            periodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            periodLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            fundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            fundLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            cdiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cdiLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cdiLabel.leadingAnchor.constraint(equalTo: fundLabel.trailingAnchor, constant: 30),
            cdiLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
