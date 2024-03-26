//
//  SubCategoryViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class JobConfigurationViewModel: BaseViewModel {
    let subcategory: SubCategory
    @Published var step: Int = 1
    @Published var stepProgress: Float = 0
    @Published var jobConfigurationSteps: [StepsDto] = []
    @Published var isLoading: Bool = false
    
    let jobConfigurationDataService = JobConfigurationDataService()
    
    init(subcategory: SubCategory) {
        self.subcategory = subcategory
        super.init()
        Task{
            await fetchJobSelections(id: subcategory.id)
        }
    }
    
    
    func progressBarVolume(){
        stepProgress = Float(step) / Float(jobConfigurationSteps.count)
    }
    
    func nextStep() {
            step += 1
            progressBarVolume()
    }
    
    func previousStep() {
            step -= 1
            progressBarVolume()
    }
    
    var stepTitle: String? {
        guard let stepTitle = jobConfigurationSteps.first(where: {$0.step == step})?.title else { return nil }
        return stepTitle
    }
    
    var stepSelections: [StepSelectionDto]? {
        guard let stepSelections = jobConfigurationSteps.first(where: {$0.step == step})?.stepSelections else { return nil }
        return stepSelections
    }
    
    
    
    func fetchJobSelections(id: Int) async {
        do {
            self.isLoading = true
            let steps = try await jobConfigurationDataService.fetchSteps(id)
            self.jobConfigurationSteps = steps
            self.isLoading = false
            progressBarVolume()
        } catch {
            print("Error fetching titles and selections: \(error)")
        }
    }
}


