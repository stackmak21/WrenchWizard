//
//  SubCategoriesRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

class SubCategoriesRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .subCategories(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .subCategories(var vm) = navigationCommand {
            coordinator.stack.presentSheet(.subCategories(vm: vm))
        }
    }
}
