//
//  HomeContent.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI
// test commit
struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
            HomeContent(vm: viewModel)
        
        
    }
}

private struct HomeContent: View {
    @ObservedObject var vm: HomeViewModel
    
    var body: some View{
        GeometryReader{ container in
            VStack(alignment: .leading, spacing: 0){
                HomeFilterBar(vm: vm)
                    .padding(.top, container.safeAreaInsets.top)
                    .padding(.leading, container.safeAreaInsets.leading)
                    .padding(.trailing, container.safeAreaInsets.trailing)
                    .background(Color.contentBackgroundSecondary.shadow(length: .long))
                    .frame(alignment: .top)
                    .zIndex(1)
                
                
                
                    
                ScrollView(showsIndicators: false){
                    Text("All Services")
                        .font(Typography.semiBold(size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    categoriesGrid(selectionSize: buttonSize(proxy: container))
                        
                    Text("Recommended Mechanics")
                        .font(Typography.semiBold(size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            ListingItem()
                        })
                        .buttonStyle(ItemsButtonStyle())
                        .padding()
                    }
                    Spacer().frame(height: 300)
                }
            }
            .ignoresSafeArea()
            .onAppear(){
                vm.fetchCategories()
            }
            .sheet(isPresented: $vm.state.isPresented, content: {
                switch vm.state.activeSheet{
                case .mechanicsFilter:
                    MechanicPickerSheet(viewModel: vm)
                case .personFilter:
                    Text("Person")
                }
            })
        }
    }
    
    @ViewBuilder func categoriesGrid(selectionSize size: CGFloat) -> some View {
        LazyVGrid(
            columns: [GridItem(.fixed(size), spacing: 10), GridItem(.fixed(size), spacing: 10), GridItem(.fixed(size), spacing: 10)]
        ) {
            ForEach(vm.categories, id: \.self) { category in
                Button(action: {
                    
                }, label: {
                    VStack(spacing: 0) {
                        Text(category.title.capitalized)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: size, height: size)
                })
                .buttonStyle(CategoriesButtonStyle())
            }
        }
    }
    
    private func buttonSize(proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width - proxy.safeAreaInsets.leading - proxy.safeAreaInsets.trailing - 170) / 2.0
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
