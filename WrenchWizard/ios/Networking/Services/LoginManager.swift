//
//  LoginManager.swift
//  WrenchWizard
//
//  Created by Paris Makris on 1/5/24.
//

import Foundation

class LoginManager {
    
    init(){}
    
    func loginUser(loginRequest: LoginRequest) async throws -> LoginResponse {
        guard let loginResponse: LoginResponse = try await NetworkingManager.shared.performRequest(request: loginRequest, endpoint: "/api/wrenchWizard/loginUser") else { throw NetworkError.badResponse }
        return loginResponse
    }
}
