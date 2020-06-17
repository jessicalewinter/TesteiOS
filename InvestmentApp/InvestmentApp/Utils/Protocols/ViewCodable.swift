//
//  ViewCodable.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

protocol ViewCodable {
    func buildViewHierarchy()
    func setupAdditionalConfiguration()
    func setupConstraints()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupAdditionalConfiguration()
        setupConstraints()
    }
    
    func setupAdditionalConfiguration() { }
}
