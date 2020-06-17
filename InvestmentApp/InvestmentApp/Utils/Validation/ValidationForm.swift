//
//  ValidationForm.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import Foundation

enum FormType {
    case email
    case phone
    
    var regex: String {
        switch self {
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .phone:
            return "(\\(?\\d{2}\\)?\\s)?(\\d{4,5}\\-\\d{4})"
        }
    }
    
    var errorMessage: String {
        switch self {
        case .email:
            return "Email não é válido. Digite no formato nome@email.com"
        case .phone:
            return "Número não é válido. Digite no formato 91234-5678"
        }
    }
}

class ValidationForm {
    static func validate(_ text: String, type: FormType) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex).evaluate(with: text)
        return predicate
    }
}
