//
//  LabeledTextField.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI


struct LabeledTextField<TrailingContent>: View where  TrailingContent: View {
    

    let label: String?
    let style: TextFieldStyleAttributes
    let placeholder: String
    let lineLimit: Int
    @Binding var text: String
    let trailingContent: () -> TrailingContent
    
    @Environment(\.isEnabled) private var isEnabled
    @State private var isFocused: Bool = false
    
    
    init(
        label: String? = nil,
        placeholder: String,
        lineLimit: Int,
        text: Binding<String>,
        style: TextFieldStyleAttributes,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent
    ) {
        
        self.label = label
        self.placeholder = placeholder
        self.lineLimit = lineLimit
        self._text = text
        self.style = .outlined
        self.trailingContent = trailingContent
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            if let label = label {
                Text(label)
                    .font(style.typography.label)
                    
            }
            HStack{
                field
                    .lineLimit(lineLimit)
                    .font(style.typography.content)
                    .frame(height: style.textFieldHeight)
                    .accentColor(style.colors.borderColor(isEnabled: isEnabled, isFocused: isFocused))
                trailingContent()
            }
            .padding(.horizontal, 16)
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isFocused: isFocused))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8).stroke(style.colors.borderColor(isEnabled: isEnabled, isFocused: isFocused), lineWidth: 1)
            }
            
        }

        .focusCompat(isFocused: $isFocused)
        .onTapGesture {
            if #available(iOS 15, *) {
                isFocused = true
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
            style: .outlined,
            trailingContent:{ Image(systemName: "xmark")}
        )
        
    }
}


