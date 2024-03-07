//
//  SystemRoutes.swift
//  WrenchWizard
//
//  Created by Paris Makris on 5/3/24.
//

import Foundation
import SwiftUI

var systemRoutes: [NavigationRoute] = [
    BackRoute()
]

private struct BackRoute: NavigationRoute {
    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .goBack = navigationCommand {
            return true
        }
        return false
    }

    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        coordinator.stack.goBack()
    }
}









