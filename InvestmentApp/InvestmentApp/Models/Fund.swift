//
//  Fund.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

struct Fund: Decodable {
    let screen: Screen
}

struct Screen: Decodable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [DownInfo]
}

struct MoreInfo: Decodable {
    let month: TimePeriod
    let year: TimePeriod
    let twelveMonths: TimePeriod
    
    enum CodingKeys: String, CodingKey {
        case month = "month"
        case year = "year"
        case twelveMonths = "12months"
    }
}

struct TimePeriod: Decodable {
    let fund: Double
    let cdi: Double
    
    enum CodingKeys: String, CodingKey {
        case fund = "fund"
        case cdi = "CDI"
    }
}

struct Info: Decodable {
    let name: String
    let data: String
}

struct DownInfo: Decodable {
    let name: String
    let data: String?
}
