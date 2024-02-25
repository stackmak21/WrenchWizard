//
//  CategoriesButtonStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/2/24.
//

import Foundation
import SwiftUI

struct CategoriesButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.regular(size: 16))
            .background(configuration.isPressed ? .contentBackgroundSecondary : Color.white)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .shadowOffset(length: .long, x: 0.5, y: 1)
            .padding(.bottom, 8)
            .padding(.horizontal, 10)
    }
    
    
}


struct ItemsButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(8)
            .frame(width: 240)
            .shadow(length: .long)
    }
    
    
}
