//
//  LoginScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 23/4/24.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var vm: LoginViewModel = LoginViewModel()
    
    var body: some View {
        LoginContent(vm: vm)
    }
}

struct LoginContent: View {
    
    @ObservedObject var vm: LoginViewModel
    
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordFocused: Bool = false
    
    
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
                        set: { vm.username = $0})
                )
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                
                Spacer().frame(height: 20)
                
                LabeledTextField(
                    label: "Password",
                    placeholder: "Enter your password",
                    password: TextFieldPassword(isPasswordVisible: isPasswordVisible),
                    text: Binding(
                        get: { vm.password },
                        set: { vm.password = $0 }
                    ),
                    trailingContent: {
                        Button(action: {
                            isPasswordVisible = !isPasswordVisible
                        }, label: {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(Color.gray)
                        })
                        .padding(.trailing, 8)
                    }
                )
                .autocorrectionDisabled()
               

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
                ActionButton(
                    isLoading: vm.isLoading,
                    action: {vm.loginUser()},
                    loadingContent: {ActionButtonLoadingContent(text: "Logging you in..")},
                    content: {Text("Login")}
                )
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
        .hideKeyboardWhenTappedAround()
    }
}

struct GoogleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(.white.opacity(0.001))
            .font(Typography.medium(size: 18))
            .foregroundColor(.coal)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay{
                RoundedRectangle(cornerRadius: 12).stroke(configuration.isPressed ? .platingrau.opacity(0.3) : .mercury, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
    }
}

struct AppleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(.customBlack)
            .font(Typography.medium(size: 18))
            .foregroundColor(.customWhite)
            .clipShape(RoundedRectangle(cornerRadius: 12))
           
    }
}

struct BorderedImage: View {
    let image: UIImage
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .stroke(.mercury, lineWidth: 1)
                .frame(width: 74, height: 74)
            Image(uiImage: image)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}





#Preview {
    LoginScreen(vm: LoginViewModel())
}
