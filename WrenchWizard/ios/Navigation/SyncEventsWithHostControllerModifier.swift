////
////  SyncEventsWithHostControllerModifier.swift
////  WrenchWizard
////
////  Created by Paris Makris on 2/3/24.
////
//
//import Foundation
//import SwiftUI
//
//private struct SyncEventsWithHostControllerModifier: ViewModifier {
//    let coordinator: Coordinator
//    let navigator: NavigationDeck
//    
//    func body(content: Content) -> some View {
//        content
//            .onReceive(navigator.directionSubject, perform: handleDirection(_:))
//    }
//    
////    private func installRouter() {
////        let navigator = NavigationDeck()
////        let featuresRouter = NavigationRouter(
////            coordinator: coordinator,
////            featureRoutes: NavigationRouter.routes
////        )
////        featuresRouter.listenToNavigationCommands(from: navigator)
////    }
////    
////    private func onAppear() {
////        installRouter()
////        hostController.start(fromRestoreState: false)
////    }
//    
//    private func handleDirection(_ direction: NavigationDirection) {
//        coordinator.stack.push(.subCategories)
//    }
//}
//
//
//extension View {
//    func syncSceneWithHostContoller(
//        coordinator: Coordinator,
//        navigator: NavigationDeck
//    ) -> some View {
//        self.modifier(SyncEventsWithHostControllerModifier(
//            coordinator: coordinator,
//            navigator: navigator
//        ))
//    }
//}
