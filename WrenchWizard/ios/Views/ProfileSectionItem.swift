//
//  ProfileSectionItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/5/24.
//

import SwiftUI

struct ProfileSectionItem<Action>: View where Action : View {
    
    let title: String
    let image: UIImage
    let action: () -> Action
    
    init(
        title: String,
        image: UIImage,
        action: @escaping () -> Action
    ) {
        self.title = title
        self.image = image
        self.action = action
    }
    
    
    var body: some View {
        HStack{
            CircleImage(image)
            Text(title)
                .font(Typography.semiBold(size: 16))
                .foregroundStyle(.coal)
            Spacer()
            action()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.customWhite.opacity(0.001))
        .background{
            RoundedRectangle(cornerRadius: 12).stroke(.mercury, lineWidth: 1)
        }
    }
}

#Preview {
    ProfileSectionItem(title: "My Profile", image: Asset.Illustrations.appleLogo.image, action: {Image(systemName: "chevron.right")})
}
