//
//  NavigationViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 3/3/24.
//

import Foundation
import Combine

class NavigationViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let navigator: Navigator
    private let router: NavigationRouter
    
    init(navigator: Navigator, router: NavigationRouter) {
        self.navigator = navigator
        self.router = router
        
        navigator.directionSubject
            .sink { [weak self] direction in
                self?.router.handleNavigationCommand(direction.command)
            }
            .store(in: &cancellables)
    }
}
