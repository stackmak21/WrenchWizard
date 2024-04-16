//
//  SelectProfessionalDataService.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/4/24.
//

import Foundation

class SelectProffesionalDataService {
    
    init() {}
    
    func fetchProffesionals() async throws -> [Mechanic] {
        guard let fetcedMechanics: [Mechanic] = await NetworkingManager.shared.downloadData(fromURL: "\(BASE_URL)/getmechanics") else { throw NetworkError.badResponse }
        return fetcedMechanics
    }
    
}
