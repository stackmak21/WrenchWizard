//
//  Selection.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation


struct StepsDto: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let step: Int
    let subCategoryId: Int
    let stepSelections: [StepSelectionDto]
    
    enum CodingKeys: String, CodingKey {
        case id = "stepTitleId"
        case title
        case step
        case subCategoryId
        case stepSelections
    }
}

struct StepSelectionDto: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let stepTitleId: Int
    let subcategoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "stepSelectionId"
        case name
        case stepTitleId
        case subcategoryId
    }
}


