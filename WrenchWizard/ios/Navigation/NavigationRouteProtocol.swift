//
//  NavigationRouteProtocol.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation
import SwiftUI


protocol NavigationRoute {
    
    func canRoute(navigationCommand: NavigationCommand) -> Bool
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand)
    
}
