//
//  Mechanic.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/2/24.
//

import Foundation

//struct Mechanic: Identifiable, Codable {
//    let id: UUID
//    let firstName: String?
//    let lastName: String?
//    let category: String?
//    let rating: Int?
//    let company: String?
//    let phone: String?
//    let address: String?
//    let city: String?
//    let postalCode: String?
//}
//
//enum MechanicCategoryEnum: String, Codable {
//    case electrician = "ELECTRICIAN"
//    case plumber = "PLUMBER"
//    case caprenter = "CARPENTER"
//    case aluminium = "ALUMINIUM"
//}
//
// Mechanic struct matching the JSON structure
struct Mechanic: Identifiable, Codable, Hashable {
    let id: UUID
    let firstName: String
    let lastName: String
    let category: MechanicCategory
    let rating: Int
    let company: String
    let phone: String
    let address: String
    let city: String
    let postalCode: String
    let subCategoryId: Int

    // Custom keys to match JSON property names
    enum CodingKeys: String, CodingKey {
        case id = "mechanicId"
        case firstName
        case lastName
        case category
        case rating
        case company
        case phone
        case address
        case city
        case postalCode
        case subCategoryId
    }
}

// MechanicCategory enum to represent the category field
enum MechanicCategory: String, Codable {
    case carpenter = "CARPENTER"
    case plumber = "PLUMBER"
    case electrician = "ELECTRICIAN"
    case aluminium = "ALUMINIUM"
    // Add other categories as necessary
}
