//
//  InvestmentViewModelItem.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

enum InvestmentViewModelItemType {
    case introView
    case moreInfo
    case info
    case downInfo
    case investButton
}

protocol InvestmentViewModelItem {
    var type: InvestmentViewModelItemType { get }
    var rowCount: Int { get }
}

extension InvestmentViewModelItem {
    var rowCount: Int {
        return 1
    }
}
