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
            .background(configuration.isPressed ? Color.ContentBackground.contentBackgroundSecondary  : Color.white)
            .foregroundColor(.mirage)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .shadowOffset(length: .long, x: 0.5, y: 1)
    }
}

struct SubCategoriesButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.regular(size: 16))
            .background(configuration.isPressed ? Color.ContentBackground.contentBackgroundSecondary  : Color.white)
            .foregroundColor(.mirage)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay{
                RoundedRectangle(cornerRadius: 14).stroke(Color.grayLight, lineWidth: 1.0)
            }
    }
}

struct FilterButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.regular(size: 18))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(configuration.isPressed ? Color.ContentBackground.contentBackgroundSecondary  : Color.white)
            .foregroundColor(.mirage)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay{
                RoundedRectangle(cornerRadius: 8).stroke(Color.grayLight, lineWidth: 1.0)
            }
    }
}


