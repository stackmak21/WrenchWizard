//
//  Category.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/2/24.
//

import Foundation

struct Category: Identifiable, Codable, Hashable {
    var id: Int
    var title: String

    enum CodingKeys: String, CodingKey {
        case id = "categoryid"
        case title
    }
}
