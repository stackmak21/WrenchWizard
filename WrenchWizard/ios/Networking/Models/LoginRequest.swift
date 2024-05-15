//
//  LoginRequest.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/4/24.
//

import Foundation


struct LoginRequest: Codable, Hashable {
    let email: String
    let password: String
}
