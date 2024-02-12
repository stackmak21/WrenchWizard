//
//  ColorExtensions.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation
import SwiftUI

typealias SwiftUIColor = Color

extension UIColor {
    
    var components: (red: Float, green: Float, blue: Float, opacity: Float) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &o)
        
        return (Float(r), Float(g), Float(b), Float(o))
    }
    
    func toSwiftUi() -> Color {
        if #available(iOS 15.0, *) {
            return Color(uiColor: self)
        } else {
            let (r, g, b, o) = components
            return Color(
                .sRGB,
                red: Double(r),
                green: Double(g),
                blue: Double(b),
                opacity: Double(o)
            )
        }
    }
    
}
