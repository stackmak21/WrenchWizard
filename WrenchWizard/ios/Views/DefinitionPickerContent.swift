////
////  DefinitionPickerContent.swift
////  WrenchWizard
////
////  Created by Paris Makris on 26/2/24.
////
//
//import SwiftUI
//
//struct DefinitionPickerContent: View {
//    
//    var definition: Definition?
//    
//    var body: some View {
//        if let def = definition {
//            HStack(spacing: 8) {
//                if !(definition is PaymentMethod) {
//                    DefinitionIcon(definition: def).fixedSize()
//                }
//                
//                Text(def.name)
//                    .font(Typography.regular(size: 14))
//                    .foregroundColor(Color.onBackground)
//                    .lineLimit(1)
//            }
//        } else {
//            EmptyView()
//        }
//    }
//}
//
//#Preview {
//    DefinitionPickerContent()
//}
