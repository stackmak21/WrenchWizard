//
//  PrimaryButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/3/24.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    let isEnabled: Bool
    let style: ButtonStyleAttributes
    
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
        style = .primary
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal)
            .font(Typography.bold(size: 16))
            .foregroundColor(style.colors.foregroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .cornerRadius(style.cornerRadius)
    }
}
