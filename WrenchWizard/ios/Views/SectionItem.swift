//
//  SectionItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/5/24.
//

import SwiftUI

struct SectionItem<Action>: View where Action: View {
    
    var label: String?
    var title: String
    var message: String?
    var image: UIImage?
    let action: () -> Action
    
    init(
        label: String? = nil,
        title: String,
        message: String? = nil,
        image: UIImage? = nil,
        action: @escaping () -> Action
    ) {
        self.label = label
        self.title = title
        self.message = message
        self.image = image
        self.action = action
    }
    
    init(
        label: String? = nil,
        title: String,
        message: String? = nil,
        image: UIImage? = nil
    ) where Action == EmptyView {
        self.init(
            label: label,
            title: title,
            message: message,
            image: image,
            action: { EmptyView() }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    if let labelValue = label {
                        Text(labelValue)
                            .font(Typography.regular(size: 14))
                            .foregroundColor(Color.osloGray)
                        Spacer().frame(height: 4)
                    }
                    
                    Text(title)
                        .font(Typography.regular(size: 14))
                        .foregroundColor(Color.customBlack)
                }
                Spacer()
                
                action()
            }
            
            if let messageValue = message {
                Spacer().frame(height: 8)
                Text(messageValue)
                    .font(Typography.regular(size: 12))
                    .foregroundColor(Color.osloGray)
            }
        }
    }
}



#Preview {
    Group{
        SectionItem(label: "Label", title: "Title", message: "Message")
    }
}
