//
//  CircleImage.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/5/24.
//

import SwiftUI

struct CircleImage: View{
    let image: UIImage
    
    init(_ image: UIImage) {
        self.image = image
    }
    
    var body: some View {
        ZStack{
            Image(uiImage: image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.gossamer)
                .frame(width: 22, height: 22)
        }
        .frame(width: 44, height: 44)
        .background(.splashdown)
        .clipShape(Circle())
    }
}

#Preview {
    CircleImage(Asset.Illustrations.appleLogo.image)
}
