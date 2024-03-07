//
//  NavigationViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 3/3/24.
//

import Foundation
import Combine

class NavigationViewModel: ObservableObject {
    
    static let shared: NavigationViewModel = NavigationViewModel()
        
        private var cancellables = Set<AnyCancellable>()
        let navigator: Navigator
        let router: NavigationRouter
        
    private init(
        navigator: Navigator = Navigator(),
        router: NavigationRouter = NavigationRouter(coordinator: Coordinator(), featureRoutes: NavigationRouter.routes)
    ) {
            self.navigator = navigator
            self.router = router
            addSubscribers()
        }
        
        private func addSubscribers(){
            navigator.directionSubject
                .sink { [weak self] direction in
                    self?.router.handleNavigationCommand(direction.command)
                }
                .store(in: &cancellables)
        }
        
        
}
