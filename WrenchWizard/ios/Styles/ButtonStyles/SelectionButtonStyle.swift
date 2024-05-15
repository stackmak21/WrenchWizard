//
//  SelectionButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 14/3/24.
//

import Foundation
import SwiftUI

struct SelectionButtonStyle: ButtonStyle {
    
    let isEnabled: Bool
    let style: ButtonStyleAttributes
    
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
        style = .primary
    }
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(Typography.regular(size: 14))
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundColor(style.colors.foregroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed))
                .background(
                    style.colors.backgroundColor(isEnabled: isEnabled, isPressed: configuration.isPressed)
                )
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(style.colors.borderColor(isEnabled: isEnabled, isPressed: configuration.isPressed), lineWidth: 1)
                )
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 6, height: 6)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(.infinity)
                            .padding(.trailing, 8)
                    }
                )
        }
    
    
}
