//
//  LoginViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/4/24.
//

import Foundation

@MainActor
class LoginViewModel: BaseViewModel{
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    
    let loginManager = LoginManager()
    
    func loginUser(){
        
        isLoading = true
        Task{
            let apiResponse = try await loginManager.loginUser(loginRequest: LoginRequest(email: email, password: password))
            UserDetails.shared.userDetails = loginResponseToUserDetails(response: apiResponse)
            self.isLoading = false
            self.navigator.sendCommand(.home)
        }
        
    }
    
    private func loginResponseToUserDetails(response: LoginResponse) -> User {
        return User(
            userID: response.user.userID,
            firstName: response.user.firstName,
            lastName: response.user.lastName,
            email: response.user.email,
            password: response.user.password,
            enabled: response.user.enabled,
            provider: response.user.provider,
            photoURL: response.user.photoURL,
            gender: response.user.gender,
            birthday: response.user.birthday,
            seenIntroTutorial: response.user.seenIntroTutorial,
            phoneNumber: response.user.phoneNumber,
            country: response.user.country,
            fcmToken: response.user.fcmToken,
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
            timestamp: response.timestamp
        )
    }
    
    
}

struct UserDetails{
    
    static var shared = UserDetails()
    
    private init() {}
    
    var userDetails: User? = nil
}

struct User{
    var userID, firstName, lastName, email: String
    var password: String
    var enabled: Bool
    var provider: String
    var photoURL: String
    var gender, birthday: String
    var seenIntroTutorial: Bool
    var phoneNumber, country, fcmToken: String
    var accessToken, refreshToken, timestamp: String
}
