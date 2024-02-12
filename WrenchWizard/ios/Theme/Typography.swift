//
//  Typography.swift
//  WrenchWizard
//
//  Created by Paris Makris on 8/2/24.
//

import Foundation
import SwiftUI

struct Typography {
    static let button: Font = Typography.semiBold(size: 16)
    static let textFieldContent: Font = Typography.medium(size: 14)
    
    
    static func regular(size: CGFloat) -> Font {
        return FontFamily.Faktum.regular.font(size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        return FontFamily.Faktum.medium.font(size: size)
    }
    
    static func light(size: CGFloat) -> Font {
        return FontFamily.Faktum.light.font(size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        return FontFamily.Faktum.semiBold.font(size: size)
    }
    
    static func bold(size: CGFloat) -> Font {
        return FontFamily.Faktum.bold.font(size: size)
    }
}
