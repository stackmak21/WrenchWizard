//
//  SubCategoryRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation

class SubCategoryRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .subCategory(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .subCategory(let subCategory) = navigationCommand {
            coordinator.stack.push(.subCategory(subCategory: subCategory))
        }
    }
}
