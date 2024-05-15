//
//  RegisterViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/4/24.
//

import Foundation

class RegisterViewModel: BaseViewModel {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var user: LoginResponse? = nil
    
    func login(){
        
    }
    
}
