//
//  SubCategoriesViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 9/3/24.
//

import Foundation

@MainActor
class SubCategoriesViewModel: BaseViewModel {
    @Published var searchTerm: String = ""
    @Published var subCategories: [SubCategory] = []
    @Published var isLoading: Bool = false
    
    func fetchSubCategories(id: Int){
        isLoading = true
        Task{
            guard let fetchedSubCategories: [SubCategory] = await networkingManager.downloadData(fromURL: "\(BASE_URL)/getsubcategories/\(id)") else { return }
            isLoading = false
            subCategories = fetchedSubCategories
        }
    }
}
