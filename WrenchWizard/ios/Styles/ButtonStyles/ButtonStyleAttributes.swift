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
    let typography: Font
    let cornerRadius: CGFloat
    
    
    static var text: ButtonStyleAttributes {
        ButtonStyleAttributes(isBorderVisible: false, colors: textButtonColors, typography: Typography.button, cornerRadius: 12)
    }
    
    static var primary: ButtonStyleAttributes {
        ButtonStyleAttributes(isBorderVisible: false, colors: primaryButtonColors, typography: Typography.button, cornerRadius: 12)
    }
    
    static var secondary: ButtonStyleAttributes {
        ButtonStyleAttributes(isBorderVisible: false, colors: secondaryButtonColors, typography: Typography.button, cornerRadius: 12)
    }
    
    static var outlined: ButtonStyleAttributes {
        ButtonStyleAttributes(isBorderVisible: true, colors: outlinedButtonColors, typography: Typography.button, cornerRadius: 12)
    }
    
    static var secondaryOutlined: ButtonStyleAttributes {
        ButtonStyleAttributes(isBorderVisible: true, colors: outlinedSecondaryButtonColors, typography: Typography.button, cornerRadius: 12)
    }
    
    
    static func custom(
        isBorderVisible: Bool,
        colors: ButtonColorSet,
        typography: Font,
        cornerRadius: CGFloat
    ) -> ButtonStyleAttributes {
        return ButtonStyleAttributes(isBorderVisible: isBorderVisible, colors: colors, typography: Typography.button, cornerRadius: cornerRadius)
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
        normalBackground: Color.primaryNormalBackground,
        normalForeground: Color.primaryNormalForeground,
        normalBorder: Color.clear,
        pressedBackground:  Color.primaryPressedBackground,
        pressedForeground: Color.primaryPressedForeground,
        pressedBorder: Color.clear,
        disabledBackground: Color.primaryDisabledBackground,
        disabledForeground: Color.primaryDisabledForeground,
        disabledBorder: Color.clear
    )
}

var secondaryButtonColors: ButtonColorSet {
    ButtonColorSet(
        normalBackground: Color.secondaryNormalBackground,
        normalForeground: Color.secondaryNormalForeground,
        normalBorder: Color.clear,
        pressedBackground:  Color.secondaryPressedBackground.opacity(0.6),
        pressedForeground: Color.secondaryPressedForeground,
        pressedBorder: Color.clear,
        disabledBackground: Color.clear,
        disabledForeground: Color.secondaryDisabledBackground,
        disabledBorder: Color.secondaryDisabledBackground
    )
}

var textButtonColors: ButtonColorSet {
    ButtonColorSet(
        normalBackground: Color.clear,
        normalForeground: Color.primaryNormalBackground,
        normalBorder: Color.clear,
        pressedBackground:  Color.clear,
        pressedForeground: Color.primaryPressedBackground,
        pressedBorder: Color.clear,
        disabledBackground: Color.clear,
        disabledForeground: Color.mercury,
        disabledBorder: Color.clear
    )
}

var outlinedButtonColors: ButtonColorSet {
    ButtonColorSet(
        normalBackground: Color.white.opacity(0.001),
        normalForeground: Color.primaryNormalBackground,
        normalBorder: Color.primaryNormalBackground,
        pressedBackground:  Color.white.opacity(0.001),
        pressedForeground: Color.primaryPressedBackground,
        pressedBorder: Color.primaryPressedBackground,
        disabledBackground: Color.clear,
        disabledForeground: Color.primaryDisabledBackground,
        disabledBorder: Color.primaryDisabledBackground
    )
}

var outlinedSecondaryButtonColors: ButtonColorSet {
    ButtonColorSet(
        normalBackground: Color.white.opacity(0.001),
        normalForeground: Color.osloGray,
        normalBorder: Color.mercury,
        pressedBackground:  Color.white.opacity(0.001),
        pressedForeground: Color.emperor.opacity(0.8),
        pressedBorder: Color.osloGray.opacity(0.6),
        disabledBackground: Color.primaryDisabledBackground,
        disabledForeground: Color.primaryDisabledForeground,
        disabledBorder: Color.primaryDisabledBackground
    )
}

