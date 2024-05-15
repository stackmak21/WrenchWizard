//
//  LoginRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/4/24.
//

import Foundation


class LoginRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .subCategories(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .subCategories(let category) = navigationCommand {
            coordinator.stack.push(.subCategories(category: category))
        }
    }
}
