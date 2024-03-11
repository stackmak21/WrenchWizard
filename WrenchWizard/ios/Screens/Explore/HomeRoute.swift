//
//  ExploreRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation

class HomeRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .home = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .home = navigationCommand {
            coordinator.stack.push(.home)
        }
    }
}
