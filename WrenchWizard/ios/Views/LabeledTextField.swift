//
//  LabeledTextField.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI


struct LabeledTextField<TrailingContent>: View where  TrailingContent: View {
    
    let label: String?
    let placeholder: String
    let lineLimit: Int
    @Binding var text: String
    let trailingContent: () -> TrailingContent
    
    init(
        label: String? = nil,
        placeholder: String,
        lineLimit: Int,
        text: Binding<String>,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent
    ) {
        self.label = label
        self.placeholder = placeholder
        self.lineLimit = lineLimit
        self._text = text
        self.trailingContent = trailingContent
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            if let label = label {
                Text(label)
                    .font(Typography.medium(size: 14))
                    .foregroundColor(Color.black)
            }
            HStack{
                field
                    .lineLimit(lineLimit)
                    .font(Typography.regular(size: 14))
                    .accentColor(Color.red)
                trailingContent()
            }
            .frame(height: 40)
            .padding(.horizontal, 16)
            .background(Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
            }
            
        }
        
    }
    
    @ViewBuilder var field: some View {
        TextField(placeholder, text: $text)
    }
    
    
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextField(
            label: "My Label",
            placeholder: "Search",
            lineLimit: 1,
            text: .constant(""),
            trailingContent:{ Image(systemName: "xmark")}
        )
    }
}


