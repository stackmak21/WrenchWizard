//
//  SubCategoriesPickerSheet.swift
//  WrenchWizard
//
//  Created by Paris Makris on 26/2/24.
//

import SwiftUI

struct SubCategoriesListScreen: View {
    
    let category: Category
    @StateObject var vm: SubCategoriesViewModel = SubCategoriesViewModel()
    
    var body: some View {
        VStack(spacing:0){
            SubCategoriesListContent(vm: vm, category: category)
        }
    }
    
}

struct SubCategoriesListContent:View {
    
    @ObservedObject var vm: SubCategoriesViewModel
    let category: Category
    
    var body: some View {
        GeometryReader{ container in
            ScrollView(showsIndicators: false){
                categoriesGrid(selectionSize: buttonSize(proxy: container))
                    .padding(.top)
            }
        }
        .onAppear{
            vm.fetchSubCategories(id: category.id)
        }
        .toolbar{
            ToolbarBackButton {
                vm.navigator.goBack()
            }
            ToolbarTitle(title: category.title.capitalized)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder func categoriesGrid(selectionSize size: CGFloat) -> some View {
        LazyVGrid(
            columns: [GridItem(.fixed(size)), GridItem(.fixed(size))]
        ) {
            ForEach(vm.subCategories, id: \.self) { subCategory in
                Button(action: {
                    vm.navigator.sendCommand(.selectProfessional(subCategory))
                }, label: {
                    VStack(alignment: .leading ,spacing: 0){
                        image(id: subCategory.id)
                            .resizable()
                            .frame(width: 46, height: 46)
                        Spacer().frame(height: 10)
                        Text(subCategory.title.capitalized)
                            .font(Typography.semiBold(size: 20))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Spacer().frame(height: 10)
                        
                        Text("Services are hourly at $25 per hour")
                            .font(Typography.regular(size: 14))
                            .foregroundColor(Color.emperor)
                        
                        Spacer().frame(height: 10)
                        
                        Image(systemName: "arrow.right")
                            .font(Typography.semiBold(size: 16))
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: size , alignment: .leading)
                    .frame(maxHeight: .infinity)
                })
                .frame(width: size, height: 220)
                .buttonStyle(SubCategoriesButtonStyle())
            }
        }
    }
    
    func buttonSize(proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width - 32) / 2.0
    }
    
    func image(id: Int) -> Image {
        switch id {
        case 1: Image(uiImage: Asset.Illustrations.offers.image)
        case 2: Image(uiImage: Asset.Illustrations.urgentJobsRepair.image)
        case 3: Image(uiImage: Asset.Illustrations.renovation.image)
        case 4: Image(uiImage: Asset.Illustrations.constructionTradeJobs.image)
        case 5: Image(uiImage: Asset.Illustrations.removalsStorage.image)
        case 6: Image(uiImage: Asset.Illustrations.cleaning.image)
        case 7: Image(uiImage: Asset.Illustrations.householdAppliances.image)
        case 8: Image(uiImage: Asset.Illustrations.windowsAndDoors.image)
        case 9: Image(uiImage: Asset.Illustrations.events.image)
        default: Image(uiImage: Asset.Illustrations.events.image)
        }
    }
}

#Preview {
    SubCategoriesListScreen(category: Category(id: 2, title: "renovations"), vm: SubCategoriesViewModel())
    
    
    
}
