//
//  FocusNative.swift
//  WrenchWizard
//
//  Created by Paris Makris on 26/2/24.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct FocusNative: ViewModifier {
    var isFocused: Binding<Bool>
    
    @FocusState private var focusState: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($focusState)
            .onChange(of: focusState, perform: { newValue in
                isFocused.wrappedValue = newValue
            })
            .onChange(of: isFocused.wrappedValue, perform: { newValue in
                focusState = newValue
            })
    }
    
}

extension View {
    
    @ViewBuilder func focusCompat(isFocused: Binding<Bool>) -> some View {
        if #available(iOS 15, *) {
            self.modifier(FocusNative(isFocused: isFocused))
        } else {
            self
        }
    }
}

