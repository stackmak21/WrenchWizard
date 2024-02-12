//
//  FontExtensions.swift
//  WrenchWizard
//
//  Created by Paris Makris on 8/2/24.
//

import Foundation
import SwiftUI
import UIKit

typealias SwiftUiFont = Font
typealias UiKitFont = UIFont

extension FontConvertible {
    func font(size: CGFloat) -> SwiftUiFont {
        return SwiftUiFont.custom(name, size: size)
    }
    
    func uiKitFont(size: CGFloat) -> UiKitFont {
        return font(size: size)
    }
}
