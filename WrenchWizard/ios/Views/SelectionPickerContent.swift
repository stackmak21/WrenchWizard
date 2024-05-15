//
//  SelectionPickerContent.swift
//  WrenchWizard
//
//  Created by Paris Makris on 22/4/24.
//

import SwiftUI

struct SelectionPickerContent<I, ItemContent>: View where I: Hashable, ItemContent: View {
    
    let label: String
    let items: [I]
    let itemsContent: (I) -> ItemContent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(label)
                .font(Typography.medium(size: 18))
            Spacer().frame(height: 10)
            ForEach(items, id: \.self){ item in
                itemsContent(item)
                Spacer().frame(height: 8)
            }
        }
    }
}

#Preview {
    SelectionPickerContent(
        label: "What type of cleaning do you want",
        items: [SubCategory(id: 1, title: "Option 1", categoryId: 22), SubCategory(id: 1, title: "Option 2", categoryId: 22)],
        itemsContent: {item in
            SelectionPickerItem(isSelected: .constant(true), selection: item)
        }
    )
}
