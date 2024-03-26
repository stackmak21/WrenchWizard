//
//  ExploreScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 9/3/24.
//

import SwiftUI

struct ExploreScreen: View {
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        
        ExploreContent(vm: viewModel)
        
        
    }
}

private struct ExploreContent: View {
    @ObservedObject var vm: ExploreViewModel
    
    
    var body: some View{
        GeometryReader{ container in
            VStack(alignment: .leading, spacing: 0){
                ExploreFilterBar(vm: vm)
                    .padding(.top, container.safeAreaInsets.top)
                    .padding(.leading, container.safeAreaInsets.leading)
                    .padding(.trailing, container.safeAreaInsets.trailing)
                    .background(Color.ContentBackground.contentBackgroundSecondary.shadow(length: .long))
                    .frame(alignment: .top)
                    .zIndex(1)
   
                ScrollView(showsIndicators: false){
                    Text("All Services")
                        .font(Typography.semiBold(size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top])
                    
                    categoriesGrid(selectionSize: buttonSize(proxy: container))
                        .padding(.bottom)
                    
                    Text("Recommended Mechanics")
                        .font(Typography.semiBold(size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack{
                            ForEach(vm.mechanics, id: \.self.id){ mechanic in
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    ListingItem(mechanic: mechanic)
                                })
                                .buttonStyle(ListingItemButtonStyle())
                                .padding(.horizontal)
                            }
                            
                        }
                    }
                }
            }
            .background(Color.ContentBackground.contentBackgroundSecondary)
            .ignoresSafeArea()
            .onAppear(){
                vm.fetchCategories()
                vm.fetchMechanics()
            }
            
        }
    }
    
    @ViewBuilder func categoriesGrid(selectionSize size: CGFloat) -> some View {
        LazyVGrid(
            columns: [GridItem(.fixed(size), spacing: 10), GridItem(.fixed(size), spacing: 10), GridItem(.fixed(size), spacing: 10)]
        ) {
            ForEach(vm.categories, id: \.self) { category in
                Button(action: {
                    vm.navigator.sendCommand(.subCategories(category: category))
                }, label: {
                    VStack(spacing: 0) {
                        Spacer().frame(height: 16)
                        image(id: category.id)
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .top)
                            .frame(alignment: .bottom)
                        
                        Text(category.title.capitalized)
                            .lineLimit(2)
                            .frame(minHeight: 40)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(width: size, height: size)
                })
                .buttonStyle(CategoriesButtonStyle())
            }
        }
    }
    
    private func buttonSize(proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width - proxy.safeAreaInsets.leading - proxy.safeAreaInsets.trailing - 160) / 2.0
    }
    
    private func image(id: Int) -> Image {
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
    ExploreScreen(viewModel: ExploreViewModel())
}

