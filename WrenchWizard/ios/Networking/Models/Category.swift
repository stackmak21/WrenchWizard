//
//  Category.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/2/24.
//

import Foundation

struct Category: Identifiable, Codable, Hashable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id = "categoryid"
        case title
    }
}
