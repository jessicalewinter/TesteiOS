//
//  InvestmentViewModel.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class InvestmentViewModel: DefaultViewModel {
    var getAlertWithError: StringClosure?
    var needReloadItems: VoidClosure?
    
    var items = [InvestmentViewModelItem]()
    var fund: Fund?
    var screen: Screen {
        guard let fund = fund else {fatalError("could not find fund")}
        return fund.screen
    }
    var title: String {
        return screen.title
    }
    
    var fundName: String {
        return screen.fundName
    }
    
    var whatIs: String {
        return screen.whatIs
    }
    
    var definition: String {
        return screen.definition
    }
    
    var riskTitle: String {
        return screen.riskTitle
    }
    
    var introItems: [String] {
        return [screen.title, screen.fundName, screen.whatIs, screen.definition, screen.riskTitle]
    }
    
    var moreInfo: MoreInfo {
        return screen.moreInfo
    }
    
    var info: [Info] {
        return screen.info
    }
    
    var downInfo: [DownInfo] {
        return screen.downInfo
    }
    
    var numberOfSections: Int {
        return InvestmentViewModelItemType.allCases.count
    }
    
    func numberOfRows(section: Int) -> Int {
        switch InvestmentViewModelItemType(rawValue: section)! {
        case .introView:
            return 1
        case .moreInfo:
            return 3
        case .info:
            // getting error on here fetching api
            return 4
        case .downInfo:
            return 5
        case .investButton:
            return 1
        }
    }
    
    func cellFor(tableView: UITableView, and indexPath: IndexPath) -> UITableViewCell {
        switch InvestmentViewModelItemType(rawValue: indexPath.section)! {
        case .introView:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            return cell
        case .moreInfo:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            return cell
        case .downInfo:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            return cell
        case .investButton:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            return cell
        }
    }
    
    func getFund() {
        InvestmentRepository.getFund {[weak self] (result) in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.getAlertWithError?(error.localizedDescription)
                case .success(let fund):
                    self.fund = fund
                    self.needReloadItems?()
                }
            }
        }
    }
}
