//
//  InvestmentAppTests.swift
//  InvestmentAppTests
//
//  Created by Jessica Lewinter on 04/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import XCTest
@testable import InvestmentApp

class InvestmentAppTests: XCTestCase {
    var periodFormat: PeriodFormat!
    
    override func setUp() {
        periodFormat = PeriodFormat(month: TimePeriod(fund: 0.9, cdi: 90), year: TimePeriod(fund: 89, cdi: 93.9), twelveMonths: TimePeriod(fund: 3.5, cdi: 29.0))
    }
    
    override func tearDown() {
        periodFormat = nil
    }
    
    func testEmailisValid() {
        let email = "name@email.com"
        let isValid = ValidationForm.validate(email, type: .email)
        XCTAssertTrue(isValid)
    }
    
    func testEmailisNotValid() {
        let email = "firstname3823829.lastname"
        let isValid = ValidationForm.validate(email, type: .email)
        XCTAssertFalse(isValid)
    }
    
    func testphoneNumberIsValidWith9() {
        let phoneNumber = "(11) 99887-8978"
        let isValid = ValidationForm.validate(phoneNumber, type: .phone)
        XCTAssertTrue(isValid)
    }
    
    func testphoneNumberIsValidWithout9() {
        let phoneNumber = "(11) 9887-8978"
        let isValid = ValidationForm.validate(phoneNumber, type: .phone)
        XCTAssertTrue(isValid)
    }
    
    func testphoneNumberIsNotValid() {
        let phoneNumber = "993893483984"
        let isValid = ValidationForm.validate(phoneNumber, type: .phone)
        XCTAssertFalse(isValid)
    }
    
    func testMaskIsValid() {
        let phoneNumber = "85997897845"
        let mask = MaskText.format(phoneNumber: phoneNumber)
        let expectedNumber = "(85) 99789-7845"
        XCTAssertEqual(expectedNumber, mask)
    }
    
    func testIfFormatIsCorrect() {
        let expectedFormat = [["0.9%", "90.0%"], ["89.0%", "93.9%"], ["3.5%", "29.0%"]]
        let numbersFormat = periodFormat.allNumbers
        XCTAssertEqual(expectedFormat, numbersFormat)
    }
    
    func testIfFormatIsWrong() {
        let expectedFormat = [["0.9", "90.0%$"], ["89.0%", "93.9%"], ["3", "29.0%"]]
        let numbersFormat = periodFormat.allNumbers
        XCTAssertNotEqual(expectedFormat, numbersFormat)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
