//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var state = State()
    
    init(){
    
    }
    
    struct State{
        var listingType: preferenceWay = .buy
        var lists: String = ""
        var isExpanded: Bool = false
    }
}

enum preferenceWay {
    case buy
    case sell
}


