//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import Foundation

@MainActor
class ExploreViewModel: BaseViewModel{
    
    
    @Published var isLoading = false
    @Published var titleText = "Change me"
    @Published var state = State()
    @Published var searchTerm = ""
    @Published var mechanics: [Mechanic] = [Mechanic]()
    @Published var categories: [Category] = [Category]()
    @Published var category: Category? = nil
    @Published var subCategories: [SubCategory] =  [SubCategory]()
    
    
    
    
    func fetchMechanics(){
        Task{
            guard let fetchedMechanics: [Mechanic] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getmechanics") else { return }
            mechanics = fetchedMechanics
        }
    }
    
    func fetchCategories(){
        Task{
            
            guard let fetchedCategories: [Category] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getcategories") else { return }
            categories = fetchedCategories
        }
    }
    
    func fetchSubCategories(id: Int){
        Task{
            guard let fetchedSubCategories: [SubCategory] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getsubcategories/\(id)") else { return }
            subCategories = fetchedSubCategories
        }
    }
    
    
    func onFilterClicked(activeSheet: ActiveSheet){
        state.isPresented = true
        state.activeSheet = activeSheet
    }
    
    struct State{
        var lists: String = ""
        var filterState: FilterState = FilterState()
        var isPresented: Bool = false
        var activeSheet: ActiveSheet = .mechanicsFilter
        var searchTerm: String = ""
        var mechanics: [String] = ["plumber", "electrician", "car engine"]
        
    }
    
    struct FilterState{
        var isExpanded: Bool = false
    }
}


enum ActiveSheet{
    case mechanicsFilter
    case personFilter
    case subCategories
}


