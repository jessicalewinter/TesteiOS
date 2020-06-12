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
            return "^\\([1-9]{2}\\) (?:[2-8]|9[1-9])[0-9]{3}\\-[0-9]{4}$"
        }
    }
}

class ValidationForm {
    static func validate(_ text: String, type: FormType) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex).evaluate(with: text)
        return predicate
    }
}
