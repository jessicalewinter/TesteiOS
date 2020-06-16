//
//  InvestmentView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InvestmentView: UIView {
    var dataSource: InvestmentDataSource!
    var viewModel = InvestmentViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self.dataSource
        tableView.registerCell(IntroTableViewCell.self)
        tableView.registerCell(MoreInfoTableViewCell.self)
        tableView.registerCell(MoreInfoPeriodTableViewCell.self)
        tableView.registerCell(InfoTableViewCell.self)
        tableView.registerCell(SeparatorTableViewCell.self)
        tableView.registerCell(DownInfoTableViewCell.self)
        return tableView
    }()
    
    lazy var loadingView: LoadingView = {
        let loading = LoadingView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    init() {
        super.init(frame: .zero)
        self.dataSource = InvestmentDataSource(viewModel: viewModel)
        setupView()
        bindtoViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        loadingView.isHidden = false
        loadingView.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingView.activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }
}

extension InvestmentView: ViewCodable {
    func buildViewHierarchy() {
        addSubViews([
            tableView,
            loadingView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}

extension InvestmentView: Bindable {
    func bindtoViewModel() {
        
        viewModel.isLoading = { [weak self] isLoading in
            guard let self = self else {return}
            if isLoading {
                self.startLoading()
            } else {
                self.stopLoading()
            }
        }
        
        viewModel.needReloadItems = { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
        
        viewModel.getFund()
    }
    
}
