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
class SubCategoryViewModel: BaseViewModel {
    let subcategory: SubCategory
    @Published var step: Int = 1
    @Published var stepProgress: Float = 0
    @Published var selections: [SelectionList] = []
    
    let jobConfigurationDataService = JobConfigurationDataService()
    
    init(subcategory: SubCategory) {
        self.subcategory = subcategory
        super.init()
        Task{
            await fetchJobSelections(id: subcategory.id)
        }
    }
    
    
    func progressBarVolume(){
        stepProgress = Float(step) / Float(selections.count)
    }
    
    func nextStep() {
        withAnimation{
            step += 1
            progressBarVolume()
        }
    }
    
    var stepTitle: String? {
        let stepSelection = selections.first(where: {$0.step == step})
        guard let selectionTitle = stepSelection?.title else { return nil }
        return selectionTitle
    }
    
    var stepSelections: [String]? {
        let stepSelection = selections.first(where: {$0.step == step})
        guard let selections = stepSelection?.selections else { return nil }
        return selections
    }
    
    
    
    func fetchJobSelections(id: Int) async {
        do {
            let (titles, selections) = try await jobConfigurationDataService.fetchTitlesAndSelections(id)
            let mappedSelections = mapJobSelections(jobConfigurationSelection: selections, jobConfigurationTitle: titles)
            self.selections = mappedSelections
            progressBarVolume()
        } catch {
            // Handle error
            print("Error fetching titles and selections: \(error)")
        }
    }
    
    private func mapJobSelections(jobConfigurationSelection: [JobConfigurationSelection], jobConfigurationTitle: [JobConfigurationTitle]) -> [SelectionList] {
        var selectionList: [SelectionList] = []
        for item in jobConfigurationTitle {
            let filteredSelections = jobConfigurationSelection.filter { $0.stepTitleId == item.id }
            let selectionNames = filteredSelections.map { $0.name }
            let selection = SelectionList(id: item.id, title: item.title, step: item.step, selections: selectionNames)
            selectionList.append(selection)
        }
        return selectionList
    }
}


