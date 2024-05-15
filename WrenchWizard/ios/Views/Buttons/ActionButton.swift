//
//  ActionButton.swift
//  WrenchWizard
//
//  Created by Paris Makris on 27/4/24.
//

import SwiftUI

struct ActionButton<Content, LoadingContent>: View where Content: View, LoadingContent: View {
    @Environment(\.isEnabled) private var isEnabled
    
    let isLoading: Bool
    let style: ButtonStyleAttributes
    let action: () -> Void
    let loadingContent: () -> LoadingContent
    let content: () -> Content
    
    init(
        isLoading: Bool = false,
        style: ButtonStyleAttributes = .primary,
        action: @escaping () -> Void,
        @ViewBuilder loadingContent: @escaping () -> LoadingContent,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isLoading = isLoading
        self.style = style
        self.action = action
        self.loadingContent = loadingContent
        self.content = content
    }
    
    init(
        isLoading: Bool = false,
        style: ButtonStyleAttributes = .primary,
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) where LoadingContent == ActionButtonLoadingContent {
        self.init(
            isLoading : isLoading,
            style : style,
            action : action,
            loadingContent : {
                ActionButtonLoadingContent(color: style.colors.normalForeground)
            },
            content : content
        )
    }
    
    var body: some View {
        
        Button {
            if !isLoading {
                action()
            }
        } label: {
            Group{
                if isLoading {
                    loadingContent()
                }
                else {
                    content()
                }
            }
            .font(style.typography)
            .padding(EdgeInsets(top: 8, leading: 28, bottom: 8, trailing: 28))
            .frame(maxWidth: .infinity)
            .frame(height: 56)
        }
        .buttonStyle(ActionButtonStyle(isEnabled: isEnabled, style: style))
    }
}



struct ActionButtonLoadingContent: View {
    let color: Color
    let text: String
    
    init(color: Color = .customWhite, text: String = "") {
        self.color = color
        self.text = text
    }
    
    var body: some View {
        if text.isEmpty {
            ActivityIndicator(color: color).fixedSize()
        } else {
            HStack {
                ActivityIndicator(color: color).fixedSize()
                Text(text)
                    .padding(.leading, 8)
                    .foregroundColor(color)
            }
        }
    }
}


#Preview {
    Group{
       
        ActionButton(isLoading: true, style: .primary, action: {}, loadingContent: {ActionButtonLoadingContent(text: "Loading...")}, content: {Text("Login")})
            .disabled(false)
    
        
        ActionButton(isLoading: true, style: .secondary, action: {}, loadingContent: {ActionButtonLoadingContent(color: .osloGray, text: "Loading...")}, content: {Text("Login")})
            .disabled(false)
        
        
        ActionButton(isLoading: true, style: .outlined, action: {}, loadingContent: {ActionButtonLoadingContent(color: .osloGray, text: "Loading...")}, content: {Text("Login")})
            .disabled(false)
        
        ActionButton(isLoading: false, style: .secondaryOutlined, action: {}, loadingContent: {ActionButtonLoadingContent(color: .osloGray, text: "Loading...")}, content: {Text("Login")})
            .disabled(false)
        
        ActionButton(isLoading: false, style: .text, action: {}, loadingContent: {ActionButtonLoadingContent(color: .osloGray, text: "Loading...")}, content: {Text("Login")})
            
            
    }
}
