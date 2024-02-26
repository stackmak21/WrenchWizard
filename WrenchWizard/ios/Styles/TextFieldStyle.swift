//
//  TextFieldStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//
import Foundation
import SwiftUI

struct TextFieldStyleAttributes {
    var textFieldHeight: CGFloat
    var typography: TextFieldTyporaphySet
    var colors: TextFieldColorSet
    
    static var outlined: TextFieldStyleAttributes {
        TextFieldStyleAttributes(
            textFieldHeight: normalTextFieldHeight,
            typography: outlinedTextFieldTypohraphy,
            colors: outlinedTextFieldColors
        )
    }
    
    static var outlinedSmall: TextFieldStyleAttributes {
        var outlined = TextFieldStyleAttributes.outlined
        outlined.textFieldHeight = smallTextFieldHeight
        return outlined
    }
}

struct TextFieldColorSet {
    var normalForeground: Color
    var focusedForeground: Color
    var disabledForeground: Color

    var normalBackground: Color
    var focusedBackground: Color
    var disabledBackground: Color
    
    
    var normalAccent: Color
    var focusedAccent: Color
    var disabledAccent: Color
    
    var normalBorder: Color
    var focusedBorder: Color
    var disabledBorder: Color
    
    
    func backgroundColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedBackground : normalBackground
        } else {
            return disabledBackground
        }
    }
 
    func foregroundColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedForeground : normalForeground
        } else {
            return disabledForeground
        }
    }
    
    func accentColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
                return isFocused ? focusedAccent : normalAccent
        } else {
            return disabledAccent
        }
    }
    
    func borderColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedBorder : normalBorder
        } else {
            return disabledForeground
        }
    }

}

struct TextFieldTyporaphySet {
    var content: Font
    var label: Font
}

let outlinedTextFieldColors = TextFieldColorSet(
    normalForeground: Color.TextField.normalForeground,
    focusedForeground: Color.TextField.focusedForeground,
    disabledForeground: Color.TextField.disabledForeground,
    normalBackground: Color.TextField.normalBackground,
    focusedBackground: Color.TextField.focusedBackground,
    disabledBackground: Color.TextField.disabledBackground,
    normalAccent: Color.TextField.normalAccent,
    focusedAccent: Color.TextField.focusedAccent,
    disabledAccent: Color.TextField.disabledAccent,
    normalBorder: Color.TextField.normalBorder,
    focusedBorder: Color.TextField.focusedBorder,
    disabledBorder: Color.TextField.disabledBorder
)

let outlinedTextFieldTypohraphy = TextFieldTyporaphySet(
    content: Typography.medium(size: 14),
    label: Typography.semiBold(size: 11)
)

let normalTextFieldHeight: CGFloat = 48
let smallTextFieldHeight: CGFloat = 40
