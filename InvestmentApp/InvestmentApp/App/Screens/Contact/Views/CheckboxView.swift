//
//  CheckboxView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 12/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class CheckboxView: UIView {
    var flag: Bool = false
    
    lazy var checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "checkbox")
        return imageView
    }()
    
    lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.normalRegularTitle
        label.textColor = UIColor.placeholder
        return label
    }()
    
    @objc func changeImage() {
        flag.toggle()
        if flag {
            checkImage.image = UIImage(named: "checkboxFilled")
        } else {
            checkImage.image = UIImage(named: "checkbox")
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CheckboxView: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            checkImage,
            checkLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            checkImage.widthAnchor.constraint(equalToConstant: 20),
            checkImage.heightAnchor.constraint(equalToConstant: 20),
            checkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            checkLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 10),
            checkLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
