//
//  ExploreScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 9/3/24.
//

import SwiftUI

struct ExploreScreen: View {
    
    @StateObject var viewModel: ExploreViewModel = ExploreViewModel()
    
    var body: some View {
        ExploreContent(vm: viewModel)
    }
}

struct ExploreContent: View {
    
    let user = UserDetails.shared.userDetails
    @ObservedObject var vm: ExploreViewModel
    
    var body: some View{
        GeometryReader{ container in
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 0){
                    locationSection(container)
                    searchSection(container)
                    categoriesGrid(selectionSize: buttonSize(proxy: container))
                        .padding(.bottom)
                }
            }
            .background(Color.contentBackgroundSecondary).ignoresSafeArea()
            .onAppear(){
                vm.fetchCategories()
            }
        }
        .hideKeyboardWhenTappedAround()
    }
    
    @ViewBuilder func categoriesGrid(selectionSize size: CGFloat) -> some View {
        LazyVGrid(
            columns: [GridItem(.fixed(size), spacing: 10), GridItem(.fixed(size), spacing: 10)]
        ) {
            ForEach(vm.categories, id: \.self) { category in
                Button(action: {
                    vm.navigator.sendCommand(.subCategories(category: category))
                }, label: {
                    ZStack{
                        image(id: category.id)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        VStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0){
                                Text(category.title.capitalized)
                                    .font(Typography.semiBold(size: 16))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .frame(height: 44, alignment: .top)
                                Text("12 Services")
                                    .font(Typography.regular(size: 14))
                                    .foregroundColor(Color.emperor)
                                Spacer().frame(height: 16)
                                Image(systemName: "arrow.right")
                                    .font(Typography.semiBold(size: 16))
                                Spacer()
                            }
                            .frame(maxWidth: size , alignment: .leading)
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.leading, 8)
                            .padding(.top, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: size, height: 120)
                })
                .buttonStyle(CategoriesButtonStyle())
            }
        }
    }
    
    @ViewBuilder func locationSection(_ container: GeometryProxy) -> some View {
        if let user = user{
            Label(
                title: { Text(user.email).font(Typography.bold(size: 20)) },
                icon: { Image(systemName: "location.circle.fill").resizable().foregroundColor(.gossamer).frame(width: 30, height: 30) }
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16 + container.safeAreaInsets.top)
            .padding(.leading)
        }
    }
    
    @ViewBuilder func searchSection(_ container: GeometryProxy) -> some View {
        VStack(spacing: 0){
            Group{
                Text("Hey Paris")
                    .font(Typography.semiBold(size: 20))
                    .foregroundColor(.alto)
                Text("Can I help you something? ")
                    .font(Typography.regular(size: 16))
                    .foregroundColor(.alto)
                    .padding(.bottom, 12)
               

                LabeledTextField(
                    style: .outlinedSmall,
                    placeholder: "search",
                    text: Binding(
                        get: {
                            vm.searchTerm
                        },
                        set: {
                            vm.searchTerm = $0
                        }
                    )
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.gossamer)
        .cornerRadius(14)
        .padding()
    }
    
    func buttonSize(proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width - 50) / 2.0
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
    ExploreScreen(viewModel: ExploreViewModel())
}

