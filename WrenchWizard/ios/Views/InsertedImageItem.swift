//
//  InsertedImageItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 22/4/24.
//

import SwiftUI

struct InsertedImageItem: View {
    
    let image: UIImage
    let onRemove: () -> Void
    
    var body: some View {
        
            ZStack(alignment: .topTrailing){
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                Button {
                    onRemove()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.alto)
                        .font(Typography.bold(size: 20))
                        .frame(width: 8, height: 8)
                }
                
                .frame(width: 22, height: 22)
                .background(.gossamer)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.alto, lineWidth: 2)
                }
                .offset(x: 6, y: -6)
            }
        
        .frame(width: 86, height: 86)
        
    }
}

#Preview {
    InsertedImageItem(image: Asset.Illustrations.bathroom.image, onRemove: {})
}
