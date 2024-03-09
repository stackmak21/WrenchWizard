//
//  MechanicPickerScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI

struct MechanicPickerSheet: View {
    
    @ObservedObject  var viewModel: ExploreViewModel
    
    var body: some View {
        PickerContent(
            title: "Select Mechanic",
            isSearchAllowed: true,
            searchTerm: $viewModel.state.searchTerm,
            items: viewModel.state.mechanics,
            itemContent: { mechanic in
                    Text(mechanic)
                .padding(.horizontal, 16)
            },
            onBackClicked: {
                
            }
        )
       
    }
    
}
