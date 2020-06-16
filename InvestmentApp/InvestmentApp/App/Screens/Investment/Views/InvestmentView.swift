//
//  InvestmentView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InvestmentView: UIView {
    let dataSource = InvestmentDataSource()
    var viewModel = InvestmentViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.registerCell(IntroTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self.dataSource
//        tableView.delegate = self
//        table.estimatedRowHeight = 210
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        dataSource.viewModel = viewModel
        setupView()
        bindtoViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InvestmentView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}

extension InvestmentView: Bindable {
    func bindtoViewModel() {
        viewModel.getFund()
    }
    
    
}
