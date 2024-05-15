//
//  RegisterRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/4/24.
//

import Foundation

class RegisterRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .register = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .register = navigationCommand {
            coordinator.stack.push(.register)
        }
    }
}
