////
////  FilterBar.swift
////  WrenchWizard
////
////  Created by Paris Makris on 13/2/24.
////
//
//import SwiftUI
//
//struct ExploreFilterBar: View {
//    
//    @ObservedObject var vm: ExploreViewModel
//    private var state: ExploreViewModel.State {
//        vm.state
//    }
//    
//    var body: some View {
//        VStack(spacing: 0){
//            HStack{
//                searchTextField
//                expandFilterButton
//            }
//            .padding(.horizontal, 16)
//            Spacer().frame(height: 16)
//            if state.filterState.isExpanded{
//                expandedFilters
//            }
//        }
//    }
//    
//    
//    
//    @ViewBuilder var searchTextField: some View {
//        LabeledTextField(
//            placeholder: "Search by service or pro",
//            lineLimit: 1,
//            text:
//                Binding<String>(
//                    get: {
//                        vm.searchTerm
//                    },set: {
//                        vm.searchTerm = $0
//                    }),
//            style: .outlinedSmall,
//            trailingContent: {
//                if !vm.searchTerm.isEmpty{
//                    Button(action: {
//                        vm.searchTerm = ""
//                    }, label: {
//                        Image(systemName: "xmark")
//                            .font(.system(size: 8))
//                            .padding(.horizontal, 8)
//                    })
//                    .buttonStyle(ClearActionButtonStyle())
//                }
//            }
//        )
//    }
//    
//    @ViewBuilder var expandedFilters: some View {
//        HStack {
//            PickerButton(
//                isPlaceholderVisible: true,
//                canClear: true,
//                onClick: { vm.onFilterClicked(activeSheet: .mechanicsFilter) },
//                onClearClick: {},
//                placeholder: {
//                    PickerButtonPlaceholder(text: "Select Jobs")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                },
//                content: {
//                    Text("find mechanic")
//                        .font(Typography.regular(size: 14))
//                        .foregroundColor(Color.black)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .lineLimit(1)
//                }
//            )
//            .frame(height: 48)
//            
//            PickerButton(
//                isPlaceholderVisible: true,
//                canClear: true,
//                onClick: { vm.onFilterClicked(activeSheet: .personFilter) },
//                onClearClick: { },
//                placeholder: {
//                    PickerButtonPlaceholder(text: "")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                },
//                content: {
//                    Text("find yours jobs")
//                        .font(Typography.regular(size: 14))
//                        .foregroundColor(Color.black)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .lineLimit(1)
//                }
//            )
//            .frame(height: 48)
//        }
//        .padding(.horizontal, 16)
//        Spacer().frame(height: 16)
//    }
//    
//    @ViewBuilder var expandFilterButton: some View {
//        ExpandFilterButton(
//            isExpanded: vm.state.filterState.isExpanded,
//            appliedFilters: 1,
//            onToggle: {vm.state.filterState.isExpanded.toggle()}
//        )
//            .frame(width: 40, height: 40)
//    }
//}
//
//
//
//
