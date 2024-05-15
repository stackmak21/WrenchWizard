//
//  LabeledTextField.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI


struct LabeledTextField<TrailingContent, LeadingContent>: View where  TrailingContent: View, LeadingContent: View {
    

    let label: String?
    let style: TextFieldStyleAttributes
    let placeholder: String
    let helper: String
    let editable: Bool
    let password: TextFieldPassword?
    let error: TextFieldError?
    let lineLimit: Int
    @Binding var text: String
    let trailingContent: () -> TrailingContent
    let leadingContent: () -> LeadingContent
    
    @Environment(\.isEnabled) private var isEnabled
    @State private var isFocused: Bool = false

    
    init(
        label: String = "",
        helper: String = "",
        placeholder: String = "",
        editable: Bool = true,
        lineLimit: Int = 1,
        error: TextFieldError? = nil,
        password: TextFieldPassword? = nil,
        text: Binding<String>,
        style: TextFieldStyleAttributes = .outlined,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent,
        @ViewBuilder leadingContent: @escaping () -> LeadingContent
    ) {
        
        self.label = label
        self.placeholder = placeholder
        self.error = error
        self.helper = helper
        self.editable = editable
        self.lineLimit = lineLimit
        self.password = password
        self._text = text
        self.style = style
        self.trailingContent = trailingContent
        self.leadingContent = leadingContent
    }
    
    init(
        style: TextFieldStyleAttributes = .outlinedSmall,
        label: String = "",
        helper: String = "",
        placeholder: String = "",
        lineLimit: Int = 1,
        editable: Bool = true,
        error: TextFieldError? = nil,
        password: TextFieldPassword? = nil,
        text: Binding<String>,
        @ViewBuilder trailingContent: @escaping  () -> TrailingContent
    ) where LeadingContent == Spacer {
        self.init(
            label: label,
            helper: helper,
            placeholder: placeholder,
            editable: editable,
            lineLimit: lineLimit,
            error: error,
            password: password,
            text: text,
            style: style,
            trailingContent: trailingContent,
            leadingContent: { Spacer(minLength: 16) }
        )
    }
    
    init(
        style: TextFieldStyleAttributes = .outlined,
        label: String = "",
        helper: String = "",
        placeholder: String = "",
        lineLimit: Int = 1,
        editable: Bool = true,
        error: TextFieldError? = nil,
        password: TextFieldPassword? = nil,
        text: Binding<String>,
        @ViewBuilder leadingContent: @escaping  () -> LeadingContent
    ) where TrailingContent == Spacer {
        self.init(
            label: label,
            helper: helper,
            placeholder: placeholder,
            editable: editable,
            lineLimit: lineLimit,
            error: error,
            password: password,
            text: text,
            style: style,
            trailingContent: { Spacer(minLength: 16) },
            leadingContent: leadingContent
        )
    }
    
    init(
        style: TextFieldStyleAttributes = .outlined,
        label: String = "",
        helper: String = "",
        placeholder: String = "",
        lineLimit: Int = 1,
        editable: Bool = true,
        error: TextFieldError? = nil,
        password: TextFieldPassword? = nil,
        text: Binding<String>
    ) where LeadingContent == Spacer, TrailingContent == Spacer {
        self.init(
            label: label,
            helper: helper,
            placeholder: placeholder,
            editable: editable,
            lineLimit: lineLimit,
            error: error,
            password: password,
            text: text,
            style: style,
            trailingContent: { Spacer(minLength: 16) },
            leadingContent: { Spacer(minLength: 16) }
        )
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            if let label = label {
                Text(label)
                    .font(style.typography.label)
                    .foregroundStyle(style.colors.label)
            }
            HStack{
                leadingContent()
                    .disabled(!isEnabled)
                
                field
                    .lineLimit(lineLimit)
                    .font(style.typography.content)
                    .frame(height: style.textFieldHeight)
                    .tint(style.colors.borderColor(isEnabled: isEnabled, isFocused: isFocused))
                    .foregroundStyle(Color.coal)
                
                trailingContent()
                    .disabled(!isEnabled)
            }
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isFocused: isFocused))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style.colors.borderColor(isEnabled: isEnabled, isFocused: isFocused), lineWidth: 1)
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
        if password != nil && !password!.isPasswordVisible {
            SecureField(
                placeholder,
                text: $text,
                onCommit: {
                    guard #available(iOS 15, *) else {
                        isFocused = false
                        return
                    }
                }
            )
            .onTapGesture {
                guard #available(iOS 15, *) else {
                    isFocused = true
                    return
                }
            }
            .disableFeaturesForPassword(password)
        } else {
            TextField(
                placeholder,
                text: $text,
                onEditingChanged: { isEditing in
                    // Change focused state when the field is being edited
                    guard #available(iOS 15, *) else {
                        isFocused = isEditing
                        return
                    }
                }
            )
            .disableFeaturesForPassword(password)
        }
    }
    
    private func errorExists() -> Bool {
        if let errorDetails = error {
            return errorDetails.isError
        } else {
            return false
        }
    }
    
    private func helperText() -> String {
        if let errorDetails = error {
            if errorDetails.isError {
                return errorDetails.textOnError
            }
        }
        return helper
    }
    
}

struct TextFieldPassword {
    let isPasswordVisible: Bool
}

struct TextFieldError {
    let isError: Bool
    let textOnError: String
}

extension View {
    @ViewBuilder fileprivate func disableFeaturesForPassword(_ password: TextFieldPassword?) -> some View {
        if password != nil {
            self
                .autocapitalization(.none)
                .disableAutocorrection(true)
        } else {
            self
        }
    }
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LabeledTextField(text: .constant("string"))
            
            LabeledTextField(
                label: "My Label",
                placeholder: "Search",
                lineLimit: 1,
                text: .constant("123"),
                style: .outlinedSmall,
                trailingContent:{ Image(systemName: "xmark")},
                leadingContent: {}
            )
            LabeledTextField(
                label: "Password",
                placeholder: "Enter your password",
                lineLimit: 1,
                password: TextFieldPassword(isPasswordVisible: false),
                text: .constant(""),
                style: .outlined,
                trailingContent: {},
                leadingContent: {}
            )
            
        }
    }
}


