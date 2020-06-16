//
//  DownInfoTableViewCell.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DownInfoTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .placeholder)
        label.text = "Coisas"
        label.textAlignment = .left
        return label
    }()
    
    lazy var downloadIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "download")
        return imageView
    }()
    
    lazy var downloadLabel: UILabel = {
        let label = UILabel(with: UIFont.smallRegularTitle, and: .action)
        label.text = "Baixar"
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

extension DownInfoTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            nameLabel,
            downloadIamge,
            downloadLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            downloadIamge.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            downloadIamge.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            downloadLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            downloadLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            downloadLabel.leadingAnchor.constraint(equalTo: downloadIamge.trailingAnchor, constant: 10),
            downloadLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
