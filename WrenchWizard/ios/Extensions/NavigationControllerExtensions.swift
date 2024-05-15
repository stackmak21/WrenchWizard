//
//  NavigationControllerExtensions.swift
//  WrenchWizard
//
//  Created by Paris Makris on 13/4/24.
//

import Foundation
import UIKit
import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    
    static var isBackEnabled: Bool = true
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && UINavigationController.isBackEnabled
    }
    
}


struct DismissKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.customWhite.opacity(0.001))
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

struct SwipeBackModifier: ViewModifier {
    
    var isEnabled: Bool
    
    func body(content: Content) -> some View {
        content.onAppear {
            UINavigationController.isBackEnabled = isEnabled
        }.onDisappear {
            UINavigationController.isBackEnabled = true
        }
    }
}

extension View {
    
    func allowSwipeBack(allow isAllowed: Bool) -> some View {
        self.modifier(SwipeBackModifier(isEnabled: isAllowed))
    }
    
    func hideKeyboardWhenTappedAround() -> some View{
        self.modifier(DismissKeyboard())
    }
}
