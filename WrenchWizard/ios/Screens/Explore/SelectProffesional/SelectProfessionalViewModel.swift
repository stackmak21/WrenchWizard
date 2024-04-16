//
//  SelectProffesionalViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/4/24.
//

import Foundation

@MainActor
class SelectProfessionalViewModel: BaseViewModel{
    
    @Published var proffesionals: [Mechanic] = []
    @Published var isLoading: Bool = false
    let selectProffesionalDataService = SelectProffesionalDataService()
    
    func fetchProffesionals() async {
        do {
            isLoading = true
            proffesionals = try await selectProffesionalDataService.fetchProffesionals()
        } catch {
            print("Failed to fetch proffesionals with error: \(error)")
        }
    }
}


