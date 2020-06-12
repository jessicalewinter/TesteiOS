//
//  ContactFormViewModel.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactFormViewModel {
    typealias VoidClosure = (() -> Void)
    typealias BooleanClosure = ((Bool) -> Void)
    typealias StringClosure = ((String) -> Void)
    
    var getAlertWithError: StringClosure?
    var needReloadForms: VoidClosure?
    
    var form: Form?
//    {
//        didSet {
//            guard let form = form else {return}
//            needReloadForms?(form.cells[0].message)
//        }
//    }
    
    func getForm() {
        InvestmentRepository.getForm {[weak self] (result) in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.getAlertWithError?(error.localizedDescription)
                case .success(let form):
                    self.form = form
                    self.needReloadForms?()
                }
            }
        }
    }
}
