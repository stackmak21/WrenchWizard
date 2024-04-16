//
//  SubCategoryScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation
import SwiftUI

//MARK: - Subcategory Screen
struct JobConfigurationScreen: View {
    
    @StateObject var vm: JobConfigurationViewModel
    let subCategory: SubCategory
    
    init(subCategory: SubCategory) {
        self.subCategory = subCategory
        _vm = StateObject(wrappedValue: JobConfigurationViewModel(subcategory: subCategory))
    }
    
    var body: some View {
        SubCategoryContent(vm: vm, subCategory: subCategory)
    }
}


//MARK: - Subcategory Content
private struct SubCategoryContent: View {
    
    @Environment(\.isEnabled) var isEnabled
    @ObservedObject var vm: JobConfigurationViewModel
    @State private var showCamera = false
        @State private var selectedImage: UIImage?
        @State var image: UIImage?
    let subCategory: SubCategory
    
    var body: some View {
        GeometryReader{ container in
            VStack{
                ScrollView{
                    
                    VStack(alignment: .center, spacing: 0){
                        Asset.Illustrations.bathroom.swiftUIImage
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                        
                        VStack(spacing: 0) {
                            Text(subCategory.title.capitalized)
                                .frame( maxWidth: .infinity, alignment: .leading)
                                .font(Typography.bold(size: 26))
                                .foregroundColor(Color.black)
                                .padding(.top)
                            
                            Spacer().frame(height: 12)
                            Text("Our AI technology selects the best professionals for you ")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(Typography.regular(size: 16))
                                .multilineTextAlignment(.leading)
                            
                            ProgressView(value: vm.stepProgress)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                            if vm.isLoading{
                                ProgressView()
                            }else{
                                Group{
                                    if let stepTitle = vm.stepTitle {
                                        Text(stepTitle)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(Typography.medium(size: 22))
                                            .multilineTextAlignment(.leading)
                                            .transition(.opacity)
                                    }
                                    
                                    Spacer().frame(height: 18)
                                    if let selections = vm.stepSelections {
                                        selectionItems(selection: selections)
                                            .transition(.scale)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.ContentBackground.contentBackgroundSecondary)
                        .clipShape(RoundedCornerShape(radius: 16, corners: [.topLeft, .topRight]))
                        .offset(y: -20)
                    }
                }
                .ignoresSafeArea()
                .overlay(alignment: .topLeading) {
                    backButton
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                                accessCameraView(selectedImage: self.$selectedImage)
                        .ignoresSafeArea()
                            }
                .onAppear{
                    Task{
                        await vm.fetchJobSelections(id: subCategory.id)
                    }
                }
                HStack{
                    if vm.step != 1{
                        stepBackButton
                    }
                    Spacer()
                }
            }
            .toolbar{
                ToolbarBackButton(action: {})
                ToolbarTitle(title: "Helloo")
            }
        }
    }
    
    @ViewBuilder func selectionItems(selection: [StepSelectionDto]) -> some View{
        ForEach(selection, id: \.self){selection in
            Button {
                vm.nextStep()
            } label: {
                HStack{
                    Text(selection.name)
                    Spacer()
                }
            }
            .buttonStyle(SelectionButtonStyle(isEnabled: isEnabled))
            Spacer().frame(height: 12)
        }
    }
    
    @ViewBuilder var backButton: some View{
        Button {
            vm.navigator.goToRoot()
        } label: {
            ToolbarImage(systemName: "chevron.left")
        }
        .buttonStyle(BackActionButtonStyle())
        .padding(.horizontal)
    }
    
    @ViewBuilder var stepBackButton: some View{
        Button(action: {
                vm.previousStep()
        }, label: {
            Label("Previous", systemImage: "chevron.backward")
                .font(Typography.semiBold(size: 16))
                .foregroundColor(Color.blue)
        })
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}


#Preview {
    JobConfigurationScreen(subCategory: SubCategory(id: 22, title: "Bathroom Renovation", categoryId: 3))
}
