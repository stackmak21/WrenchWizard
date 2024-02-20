//
//  PickerButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 13/2/24.
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
                .foregroundColor(Color.black)
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



//#Preview {
//    PickerButton()
//}

struct PickerButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PickerButton(
                isPlaceholderVisible: true,
                canClear: true,
                onClick: {},
                onClearClick: {},
                placeholder: {
                    PickerButtonPlaceholder(text: "Any cryptocurrency")
                },
                content: {
                    Text("BTC")
                }
            )
            .previewLayout(.sizeThatFits)
            
            PickerButton(
                isPlaceholderVisible: false,
                canClear: true,
                onClick: {},
                onClearClick: {},
                placeholder: {
                    PickerButtonPlaceholder(text: "Any cryptocurrency")
                },
                content: {
                    Text("BTC")
                }
            )
            .previewLayout(.sizeThatFits)
        }
        
    }
}
