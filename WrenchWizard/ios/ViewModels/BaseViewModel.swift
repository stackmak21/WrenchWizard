//
//  BaseViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 9/3/24.
//

import Foundation


class BaseViewModel: ObservableObject {
    let navigator: Navigator = NavigationViewModel.shared.navigator
    let networkingManager: NetworkingManager = NetworkingManager.shared
 
}
