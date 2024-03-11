//
//  NavigationDeck.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation
import SwiftUI
import FlowStacks

typealias NavigationStack = Routes<Screen>

enum Screen: Equatable {
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return true
    }
    
    
    case home
    case subCategories(category: Category)
    case subCategory
}


class Coordinator: ObservableObject {
    @Published var stack: NavigationStack
    
    init() {
        stack = [.root(.home, embedInNavigationView: true)]
    }
}


struct HostView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View{
        Router($coordinator.stack) { screen, _ in
            switch screen {
            case .home:
                HomeScreen()
            case .subCategories(let category):
                SubCategoriesPicker(category: category)
            case .subCategory:
                SubCategoryScreen()
            }
        
        }
        
    }
}
