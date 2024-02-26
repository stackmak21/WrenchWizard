//
//  ListingItemStyle.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/2/24.
//

import Foundation
import SwiftUI

struct ListingItemButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(8)
            .frame(width: 240)
            .shadow(length: .long)
    }
    
    
}
