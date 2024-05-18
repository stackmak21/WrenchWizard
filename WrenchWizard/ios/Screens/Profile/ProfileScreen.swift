//
//  ProfileScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/5/24.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject var vm: ProfileScreenViewModel = ProfileScreenViewModel()
    
    var body: some View {
        ProfileScreenContent(vm: vm)
    }
}

struct ProfileScreenContent: View {
    @ObservedObject var vm: ProfileScreenViewModel
    
    var body: some View {
        GeometryReader{ container in
            VStack(alignment: .leading, spacing: 0){
                HStack{
                    Image(uiImage: Asset.Illustrations.urgentJobsRepair.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.blue)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 0){
                        Text("Paraskevas Makris")
                            .font(Typography.semiBold(size: 22))
                            .foregroundStyle(.customWhite)
                            .fixedSize()
                        Text(verbatim: "parhsmakrhs@gmail.com")
                            .font(Typography.semiBold(size: 14))
                            .foregroundStyle(.customWhite)
                            .fixedSize()
                    }
                    Spacer()
                    VStack{
                        Button(action: {}, label: {
                            Image(systemName: "bell.fill")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.customWhite)
                                .frame(width: 20, height: 22)
                        })
                        
                        Spacer().frame(height: 30)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .background(.gossamer)
                
                ScrollView(showsIndicators: false){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "My Profile",
                            image: Asset.Illustrations.ProfileIcons.myProfile.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top, 16)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Billing Details",
                            image: Asset.Illustrations.ProfileIcons.billing.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Favorite Proffesionals",
                            image: Asset.Illustrations.ProfileIcons.favorite.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Manage Address",
                            image: Asset.Illustrations.ProfileIcons.manageAddress.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Refer & Earn",
                            image: Asset.Illustrations.ProfileIcons.refer.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Support",
                            image: Asset.Illustrations.ProfileIcons.support.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                   
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Delete Account",
                            image: Asset.Illustrations.ProfileIcons.delete.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        ProfileSectionItem(
                            title: "Logout",
                            image: Asset.Illustrations.ProfileIcons.logout.image,
                            action: {Image(systemName: "chevron.right")})
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    ActionButton {
                        
                    } content: {
                        Text("Become a Proffesional")
                    }
                    .padding(.vertical)

                }
                .padding(.horizontal)
                
                
                
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
