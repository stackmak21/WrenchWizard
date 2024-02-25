//
//  Shadow.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation
import SwiftUI

enum ShadowLength: CGFloat {
    case short = 1.0
    case medium = 2.0
    case long = 3.0
}

extension View {
    func shadow(length: ShadowLength) -> some View {
        return shadow(radius: length.rawValue)
        
    }
    func shadowOffset(length: ShadowLength, x: CGFloat, y: CGFloat) -> some View {
        return shadow(radius: length.rawValue, x: 1, y: 2)
    }
}
