//
//  Selection.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation


struct JobConfigurationTitle: Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var step: Int
    var subCategoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "stepTitleId"
        case title
        case step
        case subCategoryId
    }
}

struct JobConfigurationSelection: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var stepTitleId: Int
    var subcategoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "stepSelectionId"
        case name
        case stepTitleId
        case subcategoryId
    }
}


