//
//  SubCategoryScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation
import SwiftUI

struct SubCategoryScreen: View {
    
    @StateObject var vm: SubCategoryViewModel = SubCategoryViewModel()
    
    var body: some View {
        SubCategoryContent(vm: vm)
    }
}

private struct SubCategoryContent: View {
    
    @ObservedObject var vm: SubCategoryViewModel
    
    var body: some View {
        GeometryReader{ container in
            ScrollView{
                VStack(alignment: .center, spacing: 0){
                    Asset.Illustrations.bathroom.swiftUIImage
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                    VStack(spacing: 0) {
                        
                        Text("Bathroom Renovation")
                            .frame( maxWidth: .infinity, alignment: .leading)
                            .font(Typography.bold(size: 26))
                            .padding(.top)
                        
                        Spacer().frame(height: 12)
                        Text("Our AI technology selects the best professionals for you ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Typography.regular(size: 16))
                            .multilineTextAlignment(.leading)
                        
                        ProgressView(value: vm.stepProgress)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                        
                        
                        Text("How extensive is the renovation?")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Typography.medium(size: 22))
                            .multilineTextAlignment(.leading)
                        
                        Spacer().frame(height: 18)
                        
                        
                            Button {
                                
                            } label: {
                                HStack{
                                    Text("Partial Renovation (2 - 3 jobs at most)")
                                        .font(Typography.regular(size: 14))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 6, height: 6)
                                        .padding(10)
                                        .background(.blue)
                                        .cornerRadius(.infinity)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background{
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .stroke(.blue, lineWidth: 1)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())

                            
                        
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 22)
                                .fill(Color.ContentBackground.contentBackgroundSecondary)
                        )
                        .offset(y: -20)
                        
                }
            }
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                Button {
                    vm.navigator.goToRoot()
                } label: {
//                    Image(systemName: "chevron.left")
//                        .resizable()
//                        .frame(width: 8, height: 8)
                    ToolbarImage(systemName: "chevron.left")
                }
                .buttonStyle(BackActionButtonStyle())
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
        }
        
    }


#Preview {
    SubCategoryScreen()
}
