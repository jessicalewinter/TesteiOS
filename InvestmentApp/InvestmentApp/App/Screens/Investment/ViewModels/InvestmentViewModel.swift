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
    var isLoading: BooleanClosure?
    
    var items = [InvestmentViewModelItem]()
    lazy var periodConstants: PeriodFormat = {
        let period = PeriodFormat(month: self.moreInfo.month, year: self.moreInfo.year, twelveMonths: self.moreInfo.twelveMonths)
        return period
    }()
    
    var fund: Fund?
    var screen: Screen {
        // swift_lint: disable line_length
        return fund?.screen ?? Screen(title: "", fundName: "", whatIs: "", definition: "", riskTitle: "", risk: 0, infoTitle: "", moreInfo: MoreInfo(month: TimePeriod(fund: 8943, cdi: 4839), year: TimePeriod(fund: 6464, cdi: 484), twelveMonths: TimePeriod(fund: 3728372, cdi: 32093)), info: [], downInfo: [])
        
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
            return 4
        case .separator:
            return 1
        case .info:
            return screen.info.count
        case .downInfo:
            return screen.downInfo.count
        case .investButton:
            return 1
        }
    }
    
    var coordinator: InvestmentFlow?
    
    func cellFor(tableView: UITableView, and indexPath: IndexPath) -> UITableViewCell {
        switch InvestmentViewModelItemType(rawValue: indexPath.section)! {
        case .introView:
            let cell = tableView.dequeueReusableCell(for: indexPath) as IntroTableViewCell
            cell.titleLabel.text = screen.title
            cell.fundNameLabel.text = screen.fundName
            cell.whatIsLabel.text = screen.whatIs
            cell.definitionLabel.text = screen.definition
            cell.riskTitleLabel.text = screen.riskTitle
            return cell
        case .moreInfo:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(for: indexPath) as MoreInfoTableViewCell
                cell.moreInfoLabel.text = screen.infoTitle
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(for: indexPath) as MoreInfoPeriodTableViewCell
                cell.periodLabel.text = periodConstants.periodNames[indexPath.row - 1]
                cell.fundLabel.text = periodConstants.allNumbers[indexPath.row - 1][0]
                cell.cdiLabel.text = periodConstants.allNumbers[indexPath.row - 1][1]
                return cell
            }
        case .separator:
            let cell = tableView.dequeueReusableCell(for: indexPath) as SeparatorTableViewCell
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(for: indexPath) as InfoTableViewCell
            cell.nameLabel.text = info[indexPath.row].name
            cell.dataLabel.text = info[indexPath.row].data
            return cell
        case .downInfo:
            let cell = tableView.dequeueReusableCell(for: indexPath) as DownInfoTableViewCell
            cell.nameLabel.text = downInfo[indexPath.row].name
            return cell
        case .investButton:
            let cell = tableView.dequeueReusableCell(for: indexPath) as InvestButtonTableViewCell
            cell.openWebView = { [weak self] in
                guard let self = self else {return}
                self.coordinator?.coordinateToWebView()
            }
            return cell
        }
    }
    
    func getFund() {
        self.isLoading?(true)
        
        InvestmentRepository.getFund {[weak self] (result) in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.isLoading?(false)
                
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
