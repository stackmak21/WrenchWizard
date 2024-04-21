//
//  ClearActionButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 26/2/24.
//

import Foundation
import SwiftUI

struct ClearActionButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(6)
            .foregroundColor(configuration.isPressed ? Color.black.opacity(0.3) : Color.black)
            .padding(2)
            .background(configuration.isPressed ? Color.contentBackgroundPrimary.opacity(0.3) : Color.contentBackgroundPrimary)
            .clipShape(Circle())
    }
}


struct BackActionButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .foregroundColor(configuration.isPressed ? Color.black.opacity(0.3) : Color.black)
            .padding(2)
            .background(configuration.isPressed ? Color.contentBackgroundPrimary.opacity(0.8) : Color.contentBackgroundPrimary)
            .clipShape(Circle())
            .padding()
    }
}
