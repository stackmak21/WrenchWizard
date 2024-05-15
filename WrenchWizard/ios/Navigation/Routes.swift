//
//  Routes.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/3/24.
//

import Foundation


var exploreRoutes: [NavigationRoute] {
    return [
        SubCategoriesRoute(),
        JobConfigurationRoute(),
        SelectProfessionalRoute()
    ]
}

var connectRoutes: [NavigationRoute] {
    return [
        LoginRoute(),
        RegisterRoute()
    ]
}
