//
//  ToolbarItems.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI

struct ToolbarBackButton: ToolbarContent {
    
    var action: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Button {
                action()
            } label: {
                ToolbarImage(systemName: "chevron.backward")
            }
        }
    }
}

struct ToolbarTitle: ToolbarContent {
    
    var title: String
    var expand: Bool
    
    init(title: String, expand: Bool = false) {
        self.title = title
        self.expand = expand
    }
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .principal) {
            Text(title)
                .foregroundColor(Color.NavigationBar.navigationBarForeground)
                .font(Typography.semiBold(size: 18))
                .frame(maxWidth: expand ? .infinity : nil, maxHeight: .infinity)
                .padding(.vertical, 8)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fixedSize(horizontal: !expand, vertical: true)
        }
    }
}


struct ToolbarImage: View {
    
    var systemName: String
    var size: CGFloat
    var color: Color
    
    init(systemName: String, size: CGFloat = 22, color: Color = Color.NavigationBar.navigationBarForeground) {
        self.systemName = systemName
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: size, weight: .medium))
            .foregroundColor(color)
    }
}


//#Preview {
//    ToolbarItems()
//}
