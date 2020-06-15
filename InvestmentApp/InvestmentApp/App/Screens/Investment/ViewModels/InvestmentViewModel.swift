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
