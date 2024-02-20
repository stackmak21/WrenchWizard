//
//  FilterBar.swift
//  WrenchWizard
//
//  Created by Paris Makris on 13/2/24.
//

import SwiftUI

struct HomeFilterBar: View {
    
    @ObservedObject var vm: HomeViewModel
    private var state: HomeViewModel.State {
        vm.state
    }
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                LabeledTextField(
                    placeholder: "Search",
                    lineLimit: 1,
                    text:
                        Binding<String>(
                            get: {
                                vm.searchTerm
                            },set: {
                                vm.searchTerm = $0
                            }),
                    trailingContent: {
                        if !vm.searchTerm.isEmpty{
                            Button(action: {
                                vm.searchTerm = ""
                            }, label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 8))
                                    .padding(.horizontal, 8)
                            })
                            .buttonStyle(ClearActionButtonStyle())
                        }
                    }
                )
                
                ExpandFilterButton(isExpanded: vm.state.filterState.isExpanded, appliedFilters: 1, onToggle: {vm.state.filterState.isExpanded.toggle()})
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal, 16)
            Spacer().frame(height: 16)
            if state.filterState.isExpanded{                
                HStack {
                    PickerButton(
                        isPlaceholderVisible: false,
                        canClear: false,
                        onClick: { vm.onFilterClicked(activeSheet: .mechanicsFilter) },
                        onClearClick: {},
                        placeholder: { EmptyView() },
                        content: {
                            Text("find mechanic")
                                .font(Typography.regular(size: 14))
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        }
                    )
                    .frame(height: 48)
                    
                    PickerButton(
                        isPlaceholderVisible: true,
                        canClear: true,
                        onClick: { vm.onFilterClicked(activeSheet: .personFilter) },
                        onClearClick: { },
                        placeholder: {
                            PickerButtonPlaceholder(text: "find jobs")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        },
                        content: {
                            Text("find yours jobs")
                                .font(Typography.regular(size: 14))
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        }
                    )
                    .frame(height: 48)
                }
                .padding(.horizontal, 16)
                Spacer().frame(height: 16)
            }
            
        }
        
        
    }
}




