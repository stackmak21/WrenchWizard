//
//  SubCategoriesRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

class SubCategoriesRoute: NavigationRoute {
    
    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        return navigationCommand == .subCategories
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        coordinator.stack.presentSheet(.subCategories)
    }
}
