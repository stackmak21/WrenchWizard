//
//  RadioButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 21/4/24.
//

import SwiftUI

struct RadioButton: View {
    
    @Binding var isSelected: Bool
    
    
    var body: some View {
        Button {
            isSelected = !isSelected
        } label: {
            radioButton
        }
        .buttonStyle(PlainButtonStyle())

    }
    
    @ViewBuilder var radioButton: some View{
        ZStack{
            Circle()
                .stroke(borderColor, lineWidth: borderWidth)
                .frame(width: 24, height: 24)
        }
    }
    
    private var borderWidth: CGFloat{
        return isSelected ? 4 : 1
    }
    
    private var borderColor: Color {
        return isSelected ? .gossamer : .platingrau
    }
}

#Preview {
    Group{
        RadioButton(isSelected: .constant(true))
        RadioButton(isSelected: .constant(false))
    }
}
