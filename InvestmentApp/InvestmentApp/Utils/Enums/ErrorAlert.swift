//
//  ErrorAlert.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

enum ErrorAlert: String {
    case investmentLoad = "Não foi possível carregar os dados de Investimento"
    case contactLoad = "Não foi possível carregar os dados de Contato"
    case contactValidate = "Não foi possível enviar os dados, pois eles há campos com dados inválidos"
}
