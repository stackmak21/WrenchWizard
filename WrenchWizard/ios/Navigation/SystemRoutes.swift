//
//  SystemRoutes.swift
//  WrenchWizard
//
//  Created by Paris Makris on 5/3/24.
//

import Foundation
import SwiftUI

var systemRoutes: [NavigationRoute] = [
    BackRoute(),
    GoToRootRoute()
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

private struct GoToRootRoute: NavigationRoute {
    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .goToRoot = navigationCommand {
            return true
        }
        return false
    }

    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        coordinator.stack.goBackToRoot()
    }
}











