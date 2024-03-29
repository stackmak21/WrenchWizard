//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject{
    @Published var state = State()
    @Published var searchTerm = ""
    @Published var mechanics: [Mechanic] = [Mechanic]()
    
    func fetchMechanics() async {
        guard let fetchedMechanics: [Mechanic] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getmechanics") else { return }
        mechanics = fetchedMechanics
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
}


