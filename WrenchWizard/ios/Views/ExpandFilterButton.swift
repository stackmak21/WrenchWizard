//
//  ExpandFilterButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI

struct ExpandFilterButton: View {
    
    var isExpanded: Bool
    var appliedFilters: Int
    let onToggle: () -> Void
    
    var body: some View {
        Button(action: onToggle, label: {
            ZStack(alignment: .leading) {
                Image(systemName: isExpanded ? "xmark" : "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundColor(isExpanded ? Color.ContentBackground.contentBackgroundPrimary : Color.white)
                    .frame(width: isExpanded ? 12 : 18, height: 12)
                
                if appliedFilters > 0 && !isExpanded {
                    Text(String(appliedFilters))
                        .font(Typography.bold(size: 10))
                        .foregroundColor(Color.white)
                        .padding(5)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .offset(x: 6, y: -6)
                        
                }
            }
            .animation(.none, value: isExpanded)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .buttonStyle(ExpandFilterButtonStyle(isEnabled: true))
        .frame(idealWidth: 48, idealHeight: 48)
    }
}



struct ExpandFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExpandFilterButton(isExpanded: false, appliedFilters: 0, onToggle: {})
                .fixedSize()
                .previewLayout(.sizeThatFits)
            
            ExpandFilterButton(isExpanded: true, appliedFilters: 0, onToggle: {})
                .fixedSize()
                .previewLayout(.sizeThatFits)
            
            ExpandFilterButton(isExpanded: false, appliedFilters: 2, onToggle: {})
                .fixedSize()
                .previewLayout(.sizeThatFits)
        }
    }
}
