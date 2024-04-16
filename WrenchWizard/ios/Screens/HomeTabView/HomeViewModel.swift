//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var activeScreen: ActiveScreen = .home
    
}


enum ActiveScreen: String {
    case home
    case myJobs
    case post
    case messages
    case account
    
}
