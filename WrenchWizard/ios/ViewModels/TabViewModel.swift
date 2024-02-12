//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation


enum ActiveScreen: String {
    case home = "home"
    case search = "search"
    case account = "account"
    case mechanic = "listings"
    
}
class TabViewModel: ObservableObject {
    @Published var activeScreen: ActiveScreen = .home
    
}
