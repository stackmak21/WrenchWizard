//
//  CountButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 21/4/24.
//

import SwiftUI

struct CountButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.coal)
            .padding()
            .background(.white.opacity(0.001))
            
            
    }
}
