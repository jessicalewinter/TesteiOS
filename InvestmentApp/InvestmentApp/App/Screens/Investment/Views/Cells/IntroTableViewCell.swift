//
//  IntroTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class IntroTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.smallMediumTitle
        label.textColor = .lightText
        label.text = "ablubleble"
        return label
    }()
    
    lazy var fundNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.mediumTitle
        label.textColor = .darkText
        label.text = "ablubleble"
        return label
    }()
    
    lazy var separatorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "separator")
        return imageView
    }()
    
    lazy var whatIsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.normalMediumTitle
        label.textColor = .lightText
        label.text = "ablubleble"
        return label
    }()
    
    lazy var definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.normalLightTitle
        label.textColor = .lightText
        label.text = "ablubleble"
        return label
    }()
    
    lazy var riskTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.normalMediumTitle
        label.textColor = .lightText
        label.text = "ablubleble"
        return label
    }()
    
    lazy var riskView: RiskView = {
        let view = RiskView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

extension IntroTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            titleLabel,
            fundNameLabel,
            separatorImage,
            whatIsLabel,
            definitionLabel,
            riskTitleLabel,
            riskView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            fundNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            fundNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fundNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            separatorImage.topAnchor.constraint(equalTo: fundNameLabel.bottomAnchor, constant: 10),
            separatorImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separatorImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separatorImage.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            whatIsLabel.topAnchor.constraint(equalTo: separatorImage.bottomAnchor, constant: 10),
            whatIsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            whatIsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: whatIsLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            definitionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            riskTitleLabel.topAnchor.constraint(equalTo: definitionLabel.bottomAnchor, constant: 10),
            riskTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            riskTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            riskView.topAnchor.constraint(equalTo: riskTitleLabel.bottomAnchor, constant: 10),
            riskView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            riskView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            riskView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
