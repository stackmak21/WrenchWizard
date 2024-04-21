//
//  JobConfigurationSelections.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation



class JobConfigurationDataService {
    
    init() {}
    
    func fetchSteps(_ id: Int) async throws -> [StepsDto] {
        guard let fetcedSteps: [StepsDto] = await NetworkingManager.shared.downloadData(fromURL: "\(BASE_URL)/getSteps/\(id)") else { throw NetworkError.badResponse }
        return fetcedSteps
    }
    
}
