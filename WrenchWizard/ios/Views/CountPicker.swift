//
//  CountPicker.swift
//  WrenchWizard
//
//  Created by Paris Makris on 21/4/24.
//

import SwiftUI

struct CountPicker: View {
    @State var quantity: Int = 0
    
    var body: some View {
        GeometryReader{ container in
            HStack(spacing: 0){
                minusButton
                    .frame(width: (container.size.width / 3) - 5, height: container.size.height)
                quantitySection
                    .frame(width: (container.size.width / 3) + 10, height: container.size.height)
                plusButton
                    .frame(width: (container.size.width / 3) - 5, height: container.size.height)
            }
        }
        .frame(width: 180, height: 48)
        .background(.mercury)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    @ViewBuilder var quantitySection: some View{
        ZStack{
            Rectangle().foregroundColor(.alto).padding(2)
            Text("\(quantity)")
                .font(Typography.semiBold(size: 20))
        }
    }
    
    @ViewBuilder var minusButton: some View {
        Button {
            decreaseQuantity()
        } label: {
//            Image(systemName: "minus")
//                .resizable()
//                .frame(width: 18, height: 2)
            Text("-")
        }
        .buttonStyle(CountButtonStyle())
    }
    
    @ViewBuilder var plusButton: some View {
        Button {
            increaseQuantity()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 18, height: 18)
        }
        .buttonStyle(CountButtonStyle())
    }
    
    
    private func decreaseQuantity(){
        quantity -= 1
    }
    
    private func increaseQuantity(){
        quantity += 1
    }
}

#Preview {
    CountPicker()
}
