//
//  JobConfigurationSelections.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation

let BASE_URL = "https://5827-2a02-587-c404-1800-9d0e-7410-c809-1e4d.ngrok-free.app"

class JobConfigurationDataService {
    
    init() {}
    
    func fetchSteps(_ id: Int) async throws -> [StepsDto] {
        guard let fetcedSteps: [StepsDto] = await NetworkingManager.shared.downloadData(fromURL: "\(BASE_URL)/getSteps/\(id)") else { throw NetworkError.badResponse }
        return fetcedSteps
    }
    
}
