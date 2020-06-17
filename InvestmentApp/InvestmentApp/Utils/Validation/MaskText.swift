//
//  MaskText.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 17/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class MaskText {
    static func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: range, withTemplate: "")

        if number.count > 11 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 11)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }

        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }

        if number.count < 8 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)

        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{5})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }

        return number
    }
}
