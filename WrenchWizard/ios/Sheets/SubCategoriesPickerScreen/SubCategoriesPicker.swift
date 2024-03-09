//
//  SubCategoriesPickerSheet.swift
//  WrenchWizard
//
//  Created by Paris Makris on 26/2/24.
//

import SwiftUI

struct SubCategoriesPicker: View {
    
    let category: Category
    @StateObject var vm: SubCategoriesViewModel = SubCategoriesViewModel()
    
    var body: some View {
        VStack(spacing:0){
                PickerContent(
                    title: category.title.capitalized,
                    isSearchAllowed: false,
                    searchTerm: Binding(get: {
                        vm.searchTerm
                    }, set: {vm.searchTerm = $0}),
                    items: vm.subCategories) { subCategory in
                        DefinitionPickerItem(vm: vm, subCategory: subCategory)
                    } onBackClicked: {
                        vm.navigator.goToBack()
                    }
        }
            .onAppear(){
                vm.fetchSubCategories(id: category.id)
            }

    }
    
}

#Preview {
    SubCategoriesPicker(category: Category(id: 1, title: "renovations"), vm: SubCategoriesViewModel())
        .padding(.top)
        
        
}
