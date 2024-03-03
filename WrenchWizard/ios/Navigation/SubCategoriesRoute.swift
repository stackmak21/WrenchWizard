//
//  SubCategoriesRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

class SubCategoriesRoute: NavigationRoute {
    
    
    
    func canRoute(navigationCommand: NavigationCommand) -> Bool {
//        return navigationCommand == .subCategories
        if case .subCategories(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .subCategories(let data) = navigationCommand {
            coordinator.stack.presentSheet(.subCategories(data: data))
        }
    }
}
