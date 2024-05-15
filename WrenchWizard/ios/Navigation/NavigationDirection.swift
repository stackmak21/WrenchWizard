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
    case login
    case register
    case subCategories(category: Category)
    case subCategory(subCategory: SubCategory)
    case selectProfessional(_ subCategory: SubCategory)
    case goBack
    case goToRoot
}
