//
//  DefaultViewModel.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 15/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

protocol DefaultViewModel: AnyObject {
    typealias VoidClosure = (() -> Void)
    typealias BooleanClosure = ((Bool) -> Void)
    typealias StringClosure = ((String) -> Void)
    
    var getAlertWithError: StringClosure? { get }
    var needReloadItems: VoidClosure? { get }
}
