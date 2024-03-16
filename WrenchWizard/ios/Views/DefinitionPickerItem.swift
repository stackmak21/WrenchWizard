//
//  DefinitionPickerItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 8/3/24.
//

import SwiftUI

struct DefinitionPickerItem<T>: View where T: BaseViewModel {
    
    let vm: T
    var subCategory: SubCategory
    
    var body: some View {
        Button(action: {
            vm.navigator.sendCommand(.subCategory(subCategory: subCategory))
        }, label: {
            HStack(spacing: 0) {
                //                    if !(definition is PaymentMethod) {
                //                        DefinitionIcon(definition: definition)
                //                            .frame(width: 32, height: 32)
                //
                //                        Spacer().frame(width: 12)
                //                    }
                
                Text(title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.primary)
                    .font(Typography.regular(size: 16))
                
                Spacer()
            }
        })
        .frame(height: 62)
        .padding(.horizontal, 8)
    }
    
    private var title: String {
        return subCategory.title.capitalized
    }
}

#Preview {
    DefinitionPickerItem(vm: ExploreViewModel(), subCategory: SubCategory(id: 1, title: "electrical maintenace", categoryId: 3))
}
