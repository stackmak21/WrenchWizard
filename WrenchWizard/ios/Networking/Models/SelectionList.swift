//
//  Selections.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation

struct SelectionList: Identifiable, Hashable {
    let id: Int
    let title: String
    let step: Int
    let selections: [String]
}
