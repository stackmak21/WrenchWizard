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
    
    var helper: Color
    var error: Color
    
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
    
    func accentColor(isEnabled: Bool, isFocused: Bool, isError: Bool) -> Color {
        if isEnabled {
            if isError {
                return error
            } else {
                return isFocused ? focusedAccent : normalAccent
            }
        } else {
            return disabledAccent
        }
    }

//    func helperColor(isEnabled: Bool, isError: Bool) -> Color {
//        if isEnabled {
//            return isError ? error : helper
//        } else {
//            return disabledAccent
//        }
//    }
}

struct TextFieldTyporaphySet {
    var content: Font
    var label: Font
    var hint: Font
    var helper: Font
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
    helper: Color.TextField.helper,
    error: Color.orange
)

let outlinedTextFieldTypohraphy = TextFieldTyporaphySet(
    content: Typography.medium(size: 14),
    label: Typography.semiBold(size: 11),
    hint: Typography.medium(size: 12),
    helper: Typography.medium(size: 14)
)

let normalTextFieldHeight: CGFloat = 48
let smallTextFieldHeight: CGFloat = 40
