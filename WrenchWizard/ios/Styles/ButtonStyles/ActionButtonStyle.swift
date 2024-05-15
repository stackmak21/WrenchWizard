//
//  ActionButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 1/5/24.
//

import Foundation
import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    
    let isEnabled: Bool
    let style: ButtonStyleAttributes
    
    init(
        isEnabled: Bool = true,
        style: ButtonStyleAttributes = .primary
    ) {
        self.isEnabled = isEnabled
        self.style = style
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let label = configuration.label
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .foregroundColor(style.colors.foregroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .overlay(overlay(configuration: configuration))
            
        if style.cornerRadius == .infinity {
            label.clipShape(Capsule())
        } else {
            label.clipShape(RoundedRectangle(cornerRadius: style.cornerRadius))
        }
    }
    
    @ViewBuilder private func overlay(configuration: Configuration) -> some View {
        if style.cornerRadius == .infinity {
            Capsule()
                .stroke(
                    style.colors.borderColor(isEnabled: isEnabled, isPressed: configuration.isPressed),
                    lineWidth: style.isBorderVisible ? 2 : 0
                )
        } else {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .stroke(
                    style.colors.borderColor(isEnabled: isEnabled, isPressed: configuration.isPressed),
                    lineWidth: style.isBorderVisible ? 2 : 0
                )
        }
    }
}
