//
//  NavigationRouter.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation


struct NavigationRouter {
    
    static var routes: [NavigationRoute] {
        return [
            SubCategoriesRoute()
        ].flatMap({ $0 })
    }
    
    private let coordinator: Coordinator
    private let featureRoutes: [NavigationRoute]
    
    init(coordinator: Coordinator, featureRoutes: [NavigationRoute]) {
        self.coordinator = coordinator
        self.featureRoutes = featureRoutes
    }
    
//    func listenToNavigationCommands(from featuresNavigator: Navigator) {
//        featuresNavigator.setOnDirectionReceivedListener(onDirection: onCommandReceived)
//    }
    
    private func onCommandReceived(navigationDirection: NavigationDirection) {
        if let featureRoute = featureRoutes.first(where: {$0.canRoute(navigationCommand: navigationDirection.command)}) {
            featureRoute.navigate(coordinator: coordinator, navigationCommand: navigationDirection.command)
        } else {
            
        }
    }
    
}

