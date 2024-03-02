//
//  SubCategoriesPickerSheet.swift
//  WrenchWizard
//
//  Created by Paris Makris on 26/2/24.
//

import SwiftUI

struct SubCategoriesPickerSheet: View {
    
    @ObservedObject var vm = HomeViewModel()
    
    
    
    var body: some View {
        PickerContent(
            title: "Renovations",
            isSearchAllowed: false,
            searchTerm: $vm.state.searchTerm,
            items: vm.categories) { subCategory in
                Text(subCategory.title)
            } onBackClicked: {
                
            }

    }
    
}

//#Preview {
//    SubCategoriesPickerSheet(vm: HomeViewModel(), category: Category(id: 1, title: "renovations"))
//        
//}
