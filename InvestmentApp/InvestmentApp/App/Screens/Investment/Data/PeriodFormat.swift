//
//  PeriodFormat.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 16/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

class PeriodFormat {
    weak var viewModel: InvestmentViewModel?
    
    var periodNames = ["No mês", "No ano", "12 meses"]
    var month: TimePeriod
    var year: TimePeriod
    var twelveMonths: TimePeriod
    
    var allNumbers = [[String]]()
    
    init(month: TimePeriod, year: TimePeriod, twelveMonths: TimePeriod) {
        self.month = month
        self.year = year
        self.twelveMonths = twelveMonths
        fetchFromViewModel()
    }
    
    func fetchFromViewModel() {
        let monthNumbers = ["\(month.fund)%", "\(month.cdi)%"]
        let yearNumbers = ["\(year.fund)%", "\(year.cdi)%"]
        let twelveNumbers = ["\(twelveMonths.fund)%", "\(twelveMonths.cdi)%"]
        
        allNumbers = [monthNumbers, yearNumbers, twelveNumbers]
    }
}
