//
//  RegisterScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 25/4/24.
//

import SwiftUI

struct RegisterScreen: View {
    @StateObject var vm: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        RegisterContent(vm: vm)
    }
}


struct RegisterContent: View {
    
    @ObservedObject var vm: RegisterViewModel
    
    var body: some View {
        GeometryReader{ container in
            VStack(alignment: .leading, spacing: 0){
                BorderedImage(image: Asset.Illustrations.key.image)
                    .padding(.top, container.safeAreaInsets.top)
                Spacer().frame(height: 20)
                Text("Sign in your account")
                    .font(Typography.semiBold(size: 28))
                    .foregroundColor(.coal)
                Spacer().frame(height: 20)
                LabeledTextField(
                    label: "Email address",
                    placeholder: "Enter your email",
                    text: Binding(
                        get: { vm.username },
                        set: { vm.username = $0}),
                    style: .outlined,
                    trailingContent: {},
                    leadingContent: {}
                )
                Spacer().frame(height: 20)
                LabeledTextField(
                    label: "Password",
                    placeholder: "Enter your password",
                    text: Binding(
                        get: { vm.password },
                        set: { vm.password = $0 }
                    ),
                    style: .outlined,
                    trailingContent: {Image(systemName: "eye.slash")},
                    leadingContent: {}
                )
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(Typography.semiBold(size: 18))
                            .foregroundColor(.coal)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer().frame(height: 20)
                Button {
                    vm.login()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity, maxHeight: 42)
                }
                
                .buttonStyle(PrimaryButtonStyle(isEnabled: true))
                Spacer().frame(height: 30)
                LabeledDivider(label: "Or")
                Spacer().frame(height: 30)
                Button {
                    
                } label: {
                    Label(
                        title: { Text("Login with Google") },
                        icon: { Image(uiImage: Asset.Illustrations.googleLogo.image) }
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                }
                .buttonStyle(GoogleButtonStyle())
                Spacer().frame(height: 16)
                Button {
                    
                } label: {
                    Label(
                        title: { Text("Login with Apple") },
                        icon: { Image(uiImage: Asset.Illustrations.appleLogo.image).renderingMode(.template).foregroundColor(.customWhite) }
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                }
                .buttonStyle(AppleButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom, container.safeAreaInsets.bottom)
        }
    }
}



#Preview {
    RegisterScreen()
}
