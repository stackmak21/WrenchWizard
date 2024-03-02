//
//  SubCategory.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation

struct SubCategory: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let categoryid: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "subcategoryid"
        case title
        case categoryid
    }
}
