//
//  RadioButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 21/4/24.
//

import SwiftUI

struct SelectionPickerItem: View {
    
    @Binding var isSelected: Bool
    let selection: SubCategory // Type should be changed
    
    var body: some View {
        Button {
                isSelected = !isSelected
        } label: {
            selectionPicker
                
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut, value: isSelected)
    }
    
    @ViewBuilder var selectionPicker: some View{
        HStack(spacing: 0){
            Text(selection.title)
                .font(Typography.medium(size: 18))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background(.black.opacity(0.0001))
                
            
            RadioButton(isSelected: $isSelected)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .overlay{
            RoundedRectangle(cornerRadius: 12).stroke(borderColor, lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
    private var borderColor: Color {
        return isSelected ? .gossamer : .platingrau
    }
    
    private var textColor: Color {
        return isSelected ? .coal : .emperor
    }
}

#Preview {
    Group{
        SelectionPickerItem( isSelected: .constant(true), selection: SubCategory(id: 1, title: "Option 1", categoryId: 2))
        SelectionPickerItem(isSelected: .constant(false), selection: SubCategory(id: 1, title: "Option 2", categoryId: 2))
    }
    .padding(.horizontal)
}
