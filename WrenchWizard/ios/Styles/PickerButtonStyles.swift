//
//  PickerButtonStyles.swift
//  WrenchWizard
//
//  Created by Paris Makris on 13/2/24.
//

import Foundation
import SwiftUI

struct PickerButtonStyle: ButtonStyle {
    var isEnabled: Bool
    var isPlaceholderVisible: Bool
    let style: TextFieldStyleAttributes
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isFocused: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .foregroundColor(foregroundColor(configuration))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(
                style.colors.accentColor(isEnabled: isEnabled, isFocused: configuration.isPressed),
                lineWidth: 1
            ))
    }
    
    func foregroundColor(_ configuration: Configuration) -> Color {
        let color = style.colors.foregroundColor(isEnabled: isEnabled, isFocused: configuration.isPressed)
        if isPlaceholderVisible {
            return color.opacity(0.5)
        } else {
            return color
        }
    }
}

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
