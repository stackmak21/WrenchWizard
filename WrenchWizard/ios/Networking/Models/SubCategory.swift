//
//  SubCategory.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

struct SubCategory: Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var categoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "subCategoryId"
        case title
        case categoryId
    }
}
