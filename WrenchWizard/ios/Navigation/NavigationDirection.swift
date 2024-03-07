//
//  NavigationDirection.swift
//  WrenchWizard
//
//  Created by Paris Makris on 5/3/24.
//

import Foundation

struct NavigationDirection {
    let command: NavigationCommand
}


enum NavigationCommand{
    case home
    case subCategories(vm: HomeViewModel)
    case goBack
}
