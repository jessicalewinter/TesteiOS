//
//  CheckboxView.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 12/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class CheckBox: UIView {
    lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label 
    }()
}
