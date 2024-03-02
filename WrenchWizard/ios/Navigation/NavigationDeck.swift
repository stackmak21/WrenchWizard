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

class NavigationDeck: Navigator {
    
    func getDirections() -> [NavigationDirection] {
        return directions
    }
    
    
    @Published var directions: [NavigationDirection] = []
    
    func navigate(navigetionDirection: NavigationDirection) {
        var directionsList: [NavigationDirection] = []
        directionsList.append(navigetionDirection)
        sendDirections(newDirections: directionsList)
    }
    
    func sendDirections(newDirections: [NavigationDirection]){
        directions = newDirections
//        setOnDirectionReceivedListener()
    }
    
    
}

enum Screen: Equatable {
    case home
    case subCategories
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
                TabView()
            case .subCategories:
                SubCategoriesPickerSheet()
            }
        
        }
    }
}
