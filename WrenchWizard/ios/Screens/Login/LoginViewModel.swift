//
//  LoginViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/4/24.
//

import Foundation

@MainActor
class LoginViewModel: BaseViewModel{
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var user: LoginResponse? = nil
    
    let loginManager = LoginManager()
    
    func loginUser(){
        isLoading = true
        Task{
            self.user = try await loginManager.loginUser(loginRequest: LoginRequest(email: username, password: password))
            self.isLoading = false
            self.navigator.sendCommand(.home)
        }
    }
    
    
}
