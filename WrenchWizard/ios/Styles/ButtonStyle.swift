//
//  ButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/2/24.
//

import Foundation
import SwiftUI

//MARK: - Button Style Attributes
struct ButtonStyleAttributes {
    let isBorderVisible: Bool
    let colors: ButtonColorSet
    let cornerRadius: CGFloat
    
    
    static var primary: ButtonStyleAttributes {
        ButtonStyleAttributes(
            isBorderVisible: false,
            colors: primaryButtonColors,
            cornerRadius: .infinity
        )
    }
    
    
    static func custom(
        isBorderVisible: Bool,
        colors: ButtonColorSet,
        cornerRadius: CGFloat
    ) -> ButtonStyleAttributes {
        return ButtonStyleAttributes(isBorderVisible: isBorderVisible, colors: colors, cornerRadius: cornerRadius)
    }
}

//MARK: - Button Color Set Functions
struct ButtonColorSet: Equatable {
    var normalBackground: Color
    var normalForeground: Color
    var normalBorder: Color
    
    var pressedBackground: Color
    var pressedForeground: Color
    var pressedBorder: Color
    
    var disabledBackground: Color
    var disabledForeground: Color
    var disabledBorder: Color
    
    func backgroundColor(isEnabled: Bool, isPressed: Bool) -> Color {
        if isEnabled {
            return isPressed ? pressedBackground : normalBackground
        } else {
            return disabledBackground
        }
    }
    
    func foregroundColor(isEnabled: Bool, isPressed: Bool) -> Color {
        if isEnabled {
            return isPressed ? pressedForeground : normalForeground
        } else {
            return disabledForeground
        }
    }
    
    func borderColor(isEnabled: Bool, isPressed: Bool) -> Color {
        if isEnabled {
            return isPressed ? pressedBorder : normalBorder
        } else {
            return disabledBorder
        }
    }
}

//MARK: - Button Color Set Declaration
var primaryButtonColors: ButtonColorSet {
    ButtonColorSet(
        normalBackground: Color.Button.primaryNormalBackground,
        normalForeground: Color.Button.primaryNormalForeground,
        normalBorder: Color.clear,
        pressedBackground:  Color.Button.primaryPressedBackground,
        pressedForeground: Color.Button.primaryPressedForeground,
        pressedBorder: Color.clear,
        disabledBackground: Color.Button.primaryDisabledBackground,
        disabledForeground: Color.Button.primaryDisabledForeground,
        disabledBorder: Color.clear
    )
}

