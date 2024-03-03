//
//  WrenchWizardApp.swift
//  WrenchWizard
//
//  Created by Paris Makris on 8/2/24.
//

import SwiftUI

@main
struct WrenchWizardApp: App {
    
    private let coordinator = Coordinator()
    private let navigator = Navigator()
    private var router : NavigationRouter
    private let viewModel: NavigationViewModel
    
    init() {
        router = NavigationRouter(coordinator: coordinator, featureRoutes: NavigationRouter.routes)
        viewModel = NavigationViewModel(navigator: navigator, router: router)
        configureNavigationBar()
    }
    
    var body: some Scene {
        WindowGroup {
            HostView(coordinator: coordinator, viewModel: viewModel)
                .environmentObject(navigator)
        }
    }
    
    
    private func configureNavigationBar() {
        let backgroundColor = UIColor(Color.NavigationBar.navigationBarBackground)
        let foregroundColor = UIColor(Color.NavigationBar.navigationBarForeground)
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = foregroundColor
    }
}
