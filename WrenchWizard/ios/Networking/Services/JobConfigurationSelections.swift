//
//  JobConfigurationSelections.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation

let BASE_URL = "https://633e-109-178-254-91.ngrok-free.app"

class JobConfigurationDataService {
    
    init() {}
    
    func fetchSteps(_ id: Int) async throws -> [StepsDto] {
        guard let fetcedSteps: [StepsDto] = await NetworkingManager.shared.downloadData(fromURL: "\(BASE_URL)/getSteps/\(id)") else { throw NetworkError.badResponse }
        return fetcedSteps
    }
    
}
