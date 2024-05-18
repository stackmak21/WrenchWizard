//
//  LoginResponse.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/4/24.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let user: UserResponse
    let accessToken, refreshToken, timestamp: String
}

// MARK: - User
struct UserResponse: Codable{ 
    let userID, firstName, lastName, email: String
    let password: String
    let enabled: Bool
    let provider: String
    let photoURL: String
    let gender, birthday: String
    let seenIntroTutorial: Bool
    let phoneNumber, country, fcmToken: String
    
    enum CodingKeys: String, CodingKey {
          case userID = "userId"
          case firstName = "firstname"
          case lastName = "lastname"
          case email
          case password
          case enabled
          case provider
          case photoURL = "photoUrl"
          case gender
          case birthday
          case seenIntroTutorial
          case phoneNumber
          case country
          case fcmToken
      }
}

struct LoginResponseData: Codable {
    let accessToken: String
    let refreshToken: String
}
