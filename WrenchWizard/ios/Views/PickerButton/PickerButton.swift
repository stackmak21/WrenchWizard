//
//  PickerButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct PickerButton<Content, Placeholder>: View where Content: View, Placeholder: View {
    @Environment(\.isEnabled) private var isEnabled
    
    var isPlaceholderVisible: Bool
    var canClear: Bool
    let onClick: () -> Void
    let onClearClick: () -> Void
    let placeholder: () -> Placeholder
    let content: () -> Content
    
    private let style: TextFieldStyleAttributes = .outlined
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Button {
                onClick()
            } label: {
                HStack(spacing: 0) {
                    textContent
                    Spacer().frame(width: 20)
                }
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .frame(minHeight: 46)
            }
            .buttonStyle(PickerButtonStyle(isEnabled: isEnabled, isPlaceholderVisible: isPlaceholderVisible, style: style))
            
            actionContent
                .padding(.trailing, 9)
        }
    }
    
    @ViewBuilder private var textContent: some View {
        if isPlaceholderVisible {
            placeholder()
        } else {
            content()
        }
    }
    
    @ViewBuilder private var actionContent: some View {
        if isClearVisible {
            Button(action: onClearClick, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 8))
            })
            .buttonStyle(ClearActionButtonStyle())
        } else {
            Image(systemName: "chevron.compact.down")
                .resizable()
                .frame(width: 8, height: 5)
                .foregroundColor(Color.primary)
                .padding(6)
        }
    }
    
    private var isClearVisible: Bool {
        canClear && !isPlaceholderVisible
    }
}

struct PickerButtonPlaceholder: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Typography.medium(size: 14))
            .lineLimit(1)
    }
    
}

struct PickerButtonStyle: ButtonStyle {
    var isEnabled: Bool
    var isPlaceholderVisible: Bool
    let style: TextFieldStyleAttributes
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .background(style.colors.backgroundColor(isEnabled: isEnabled, isFocused: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .foregroundColor(foregroundColor(configuration))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(
                style.colors.accentColor(isEnabled: isEnabled, isFocused: configuration.isPressed, isError: false),
                lineWidth: 1
            ))
    }
    
    func foregroundColor(_ configuration: Configuration) -> Color {
        let color = style.colors.foregroundColor(isEnabled: isEnabled, isFocused: configuration.isPressed)
        if isPlaceholderVisible {
            return color.opacity(0.5)
        } else {
            return color
        }
    }
}

struct ClearActionButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(6)
            .foregroundColor(configuration.isPressed ? Color.primary.opacity(0.3) : Color.white)
            .padding(2)
            .background(configuration.isPressed ? Color.primary.opacity(0.3) : Color.primary)
            .clipShape(Circle())
    }
}

#Preview {
    PickerButton(isPlaceholderVisible: true, canClear: true, onClick: {}, onClearClick: {}, placeholder: {Text("placeholder")}, content: {Text("")})
}
