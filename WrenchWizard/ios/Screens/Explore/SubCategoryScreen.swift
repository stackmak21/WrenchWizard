//
//  SubCategoryScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/3/24.
//

import Foundation
import SwiftUI

//MARK: - Subcategory Screen
struct SubCategoryScreen: View {
    
    @StateObject var vm: SubCategoryViewModel
    let subCategory: SubCategory
    
    init(subCategory: SubCategory) {
        self.subCategory = subCategory
        _vm = StateObject(wrappedValue: SubCategoryViewModel(subcategory: subCategory))
    }
    
    var body: some View {
        SubCategoryContent(vm: vm, subCategory: subCategory)
    }
}


//MARK: - Subcategory Content
private struct SubCategoryContent: View {
    
    @Environment(\.isEnabled) var isEnabled
    @ObservedObject var vm: SubCategoryViewModel
    let subCategory: SubCategory
    
    var body: some View {
        GeometryReader{ container in
            
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
                            .padding(.top)
                        
                        Spacer().frame(height: 12)
                        Text("Our AI technology selects the best professionals for you ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Typography.regular(size: 16))
                            .multilineTextAlignment(.leading)
                        
                        ProgressView(value: vm.stepProgress)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                        
                        if let stepTitle = vm.stepTitle {
                            Text(stepTitle)
                                .minimumScaleFactor(0.1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(Typography.medium(size: 22))
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                        }
                        
                        Spacer().frame(height: 18)
                        if let selections = vm.stepSelections {
                            selectionItems(selection: selections)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.ContentBackground.contentBackgroundSecondary)
                    )
                    .offset(y: -20)
                    stepBackButton
                        .disabled(true)
                }
            }
            
            .background(.red)
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                backButton
            }
            .onAppear{
                Task{
                    await vm.fetchJobSelections(id: subCategory.id)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder func selectionItems(selection: [String]) -> some View{
        ForEach(selection, id: \.self){selection in
            Button {
                vm.nextStep()
            } label: {
                HStack{
                    Text(selection)
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
        Button{
            vm.step -= 1
        }label: {
            Text("Previous")
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}


#Preview {
    SubCategoryScreen(subCategory: SubCategory(id: 22, title: "Bathroom Renovation", categoryId: 3))
}
