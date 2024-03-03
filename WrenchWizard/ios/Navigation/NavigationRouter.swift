//
//  NavigationRouter.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import SwiftUI

struct NavigationRouter {
    private let coordinator: Coordinator
    private let featureRoutes: [NavigationRoute]
    
    static var routes: [NavigationRoute] {
        return [
            [SubCategoriesRoute()]
        ].flatMap({ $0 })
    }
    
    init(coordinator: Coordinator, featureRoutes: [NavigationRoute]) {
        self.coordinator = coordinator
        self.featureRoutes = featureRoutes
    }
    
    func handleNavigationCommand(_ command: NavigationCommand) {
        if let featureRoute = featureRoutes.first(where: { $0.canRoute(navigationCommand: command) }) {
            featureRoute.navigate(coordinator: coordinator, navigationCommand: command)
        }
    }
}

