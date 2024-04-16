//
//  SelectProffesionalScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/4/24.
//

import SwiftUI

struct SelectProfessionalScreen: View {
    let subCategory: SubCategory
    @StateObject var vm: SelectProfessionalViewModel = SelectProfessionalViewModel()
    
    var body: some View {
        SelectProffesionalContent(vm: vm, subCategory: subCategory)
    }
}

struct SelectProffesionalContent: View {
    
    @ObservedObject var vm : SelectProfessionalViewModel
    let subCategory: SubCategory
    
    var body: some View {
        VStack(spacing: 0){
            ProgressView(value: 0.25, total: 1)
            ScrollView(showsIndicators: false){
                HStack{
                    Text("120 Proffesionals")
                        .font(Typography.semiBold(size: 18))
                    Spacer()
                    Button {
                        
                    } label: {
                        Label(title: { Text("Filter") }, icon: { Image(systemName: "line.3.horizontal.circle") })
                    }
                    .buttonStyle(FilterButtonStyle())
                    
                }
                .padding(.horizontal)
                ForEach(vm.proffesionals, id: \.self){ _ in
                    ProfessionalListItem()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                }
                Spacer()
            }
        }
        .onAppear{
            Task{
                await vm.fetchProffesionals()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarBackButton{
                vm.navigator.goBack()
            }
            ToolbarTitle(title: "Select Proffesional")
            ToolbarItem(placement: .topBarTrailing) {
                Text("1/4")
            }
        }
    }
    
}

#Preview {
    SelectProfessionalScreen(subCategory: SubCategory(id: 22, title: "Bathroom Renovation", categoryId: 2))
}
