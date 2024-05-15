//
//  LabeledDivider.swift
//  WrenchWizard
//
//  Created by Paris Makris on 23/4/24.
//

import SwiftUI

struct LabeledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 10, color: Color = .platingrau) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

#Preview {
    LabeledDivider(label: "Or")
}
