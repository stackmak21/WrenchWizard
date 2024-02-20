//
//  HomeContent.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(){
            HomeContent(vm: viewModel)
        }
        
    }
}

private struct HomeContent: View {
    @ObservedObject var vm: HomeViewModel
    
    var body: some View{
        GeometryReader{ container in
            VStack(spacing: 0){
                HomeFilterBar(vm: vm)
                    .padding(.top, container.safeAreaInsets.top)
                    .padding(.leading, container.safeAreaInsets.leading)
                    .padding(.trailing, container.safeAreaInsets.trailing)
                    .background(Color.contentBackgroundSecondary.shadow(length: .long))
                    .frame(alignment: .top)
                    .zIndex(1)
                
                
                ForEach(vm.mechanics, id: \.self.id){ mechanic in
                    VStack{
                        Spacer().frame(height: 10)
                        MechanicListItem()
                            .padding(.horizontal)
                        
                    }
                        
                        
                    
                    
                }
                
                
               
                
            }
            .onAppear(perform: {
                Task{
                    await vm.fetchMechanics()
                }
            })
            .sheet(isPresented: $vm.state.isPresented, content: {
                switch vm.state.activeSheet{
                case .mechanicsFilter:
                    MechanicPickerSheet(viewModel: vm)
                case .personFilter:
                    Text("Person")
                }
            })
            
            .edgesIgnoringSafeArea([.top, .leading, .trailing])
            
            
            
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
