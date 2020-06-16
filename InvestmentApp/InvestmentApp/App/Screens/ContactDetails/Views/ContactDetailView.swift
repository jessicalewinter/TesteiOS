//
//  ContactDetailView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 14/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactDetailView: UIView {
    weak var delegateHeight: ContactViewDelegate?
    var coordinator: ContactDetailFlow?
    
    lazy var greetingMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.smallMediumTitle
        label.textColor = UIColor.lightText
        label.textAlignment = .center
        label.text = "Obrigado!"
        return label
    }()
    
    lazy var successMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.mediumTitle
        label.textColor = UIColor.darkText
        label.textAlignment = .center
        label.text = "Mensagem enviada com sucesso :)"
        return label
    }()
    
    lazy var sendAgainMessage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar nova mensagem", for: .normal)
        button.setTitleColor(.action, for: .normal)
        button.setTitleColor(.buttonPressed, for: .highlighted)
        button.titleLabel?.font = UIFont.normalMediumTitle
        button.addTarget(self, action: #selector(popView), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDelegate() {
        delegateHeight?.getAnchor(constraint: sendAgainMessage.bottomAnchor)
    }
    
    @objc func popView() {
        coordinator?.dismissDetail()
    }
}

extension ContactDetailView: ViewCodable {
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        addSubViews([
            greetingMessage,
            successMessage,
            sendAgainMessage
        ])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            greetingMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            greetingMessage.bottomAnchor.constraint(equalTo: successMessage.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            successMessage.centerYAnchor.constraint(equalTo: centerYAnchor),
            successMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            successMessage.widthAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            sendAgainMessage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
