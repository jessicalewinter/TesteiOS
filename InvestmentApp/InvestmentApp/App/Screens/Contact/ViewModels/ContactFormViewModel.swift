//
//  ContactFormViewModel.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 11/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class ContactFormViewModel: DefaultViewModel {
    var getAlertWithError: StringClosure?
    var needReloadItems: VoidClosure?
    
    var form: Form?
    
    var cells: [Cell] {
        guard let form = form else {fatalError("error getting form")}
        return form.cells
    }

    func getForm() {
        InvestmentRepository.getForm {[weak self] (result) in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.getAlertWithError?(error.localizedDescription)
                case .success(let form):
                    self.form = form
                    self.needReloadItems?()
                }
            }
        }
    }
}
