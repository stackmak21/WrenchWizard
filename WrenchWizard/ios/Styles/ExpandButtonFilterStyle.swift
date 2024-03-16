//
//  ExpandButtonFilterStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/2/24.
//

import Foundation
import SwiftUI

struct ExpandFilterButtonStyle: ButtonStyle {
    
    let isEnabled: Bool
    let style: ButtonStyleAttributes
    
    init(
        isEnabled: Bool
    ) {
        self.isEnabled = isEnabled
        style = .primary
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .cornerRadius(8)
    }
}
