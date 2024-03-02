//
//  Navigator.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

protocol Navigator {
    
    func navigate(navigetionDirection: NavigationDirection)
    
    func getDirections() -> [NavigationDirection]
    
}

protocol NavigationRoute {
    
    func canRoute(navigationCommand: NavigationItem) -> Bool
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationItem)
    
}

extension Navigator {
    
    func setOnDirectionReceivedListener() {
        var directions = getDirections()
//        if let directions.count > 0{
//            onDirection(directions)
//        }
        guard let direction = directions.first else { return }
        navigateAsync(command: direction.command)
    }
    
    func navigateAsync(command: NavigationItem) {
        let navigationDirection = NavigationDirection(command: command)
        navigate(navigetionDirection: navigationDirection)
    }
}



struct NavigationDirection{
    var command: NavigationItem
}


enum NavigationItem{
    case home
    case subCategories
}
