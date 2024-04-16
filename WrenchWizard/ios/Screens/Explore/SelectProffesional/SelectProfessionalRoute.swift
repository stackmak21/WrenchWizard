//
//  SelectProffesionalRoute.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/4/24.
//

import Foundation

class SelectProfessionalRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .selectProfessional(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .selectProfessional(let subCategory) = navigationCommand {
            coordinator.stack.push(.selectProfessional(subCategory))
        }
    }
}
