//
//  ListingsFilterBar.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct ListingsFilterBar: View {
    var state: HomeViewModel.State
//    let onEvent: (ListingsContract.Event) -> Void
    
    var body: some View {
        VStack {
            HStack {
                PickerButton(
                    isPlaceholderVisible: false,
                    canClear: false,
                    onClick: {},
                    onClearClick: {},
                    placeholder: { EmptyView() },
                    content: {
                        Text("Buy")
                            .font(Typography.regular(size: 14))

                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                    }
                )
                .frame(width: 85, height: 48)
                
                PickerButton(
                    isPlaceholderVisible: state.selectedCrypto == nil,
                    canClear: state.selectedCrypto != nil,
                    onClick: { },
                    onClearClick: { },
                    placeholder: {
                        PickerButtonPlaceholder(text: Strings.anyCrypto)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    },
                    content: {
//                        DefinitionPickerContent(definition: state.selectedCrypto)
//                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                .frame(height: 48)
                
//                ExpandFilterButton(
//                    isExpanded: state.isExpanded,
//                    appliedFilters: moreAppliedFilters,
//                    onToggle: { }
//                )
//                .fixedSize()
            }
            
            if state.isExpanded {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(Strings.currency.uppercaseLocalized())
                            .font(Typography.regular(size: 11))
                            .foregroundColor(Color.primary.opacity(0.6))
                        
                        PickerButton(
                            isPlaceholderVisible: state.selectedCurrency == nil,
                            canClear: state.selectedCurrency != nil,
                            onClick: { },
                            onClearClick: { },
                            placeholder: {
                                PickerButtonPlaceholder(text: Strings.all)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            },
                            content: {
                                Text(state.selectedCurrency?.id ?? "")
                                    .font(Typography.regular(size: 14))
                                    .foregroundColor(Color.onBackground)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(1)
                            }
                        )
                        .frame(width: 85, height: 48)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(Strings.paymentMethodLabel.uppercaseLocalized())
                            .font(Typography.regular(size: 11))
                            .foregroundColor(Color.primary.opacity(0.6))
                        
                        PickerButton(
                            isPlaceholderVisible: state.selectedPaymentMethod == nil,
                            canClear: state.selectedPaymentMethod != nil,
                            onClick: { },
                            onClearClick: { },
                            placeholder: {
                                PickerButtonPlaceholder(text: Strings.anyPaymentMethod)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            },
                            content: {
//                                DefinitionPickerContent(definition: state.selectedPaymentMethod)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        )
                        .frame(height: 48)
                    }
                    
                    SortingButton(onClick: { })
                        .frame(width: 48, height: 48)
                }
                
                if state.isClearFiltersVisible {
                    Button(
                        action: { },
                        label: {
                            Text(Strings.clearFilters)
                                .font(Typography.regular(size: 12))
                                .foregroundColor(Color.onBackground)
                        }
                    )
//                    .buttonStyle(TextButtonStyle())
                    .padding(.top, 12)
                }
            }
        }
        .padding(16)
    }
    
//    private var moreAppliedFilters: Int {
//        var applied: Int = 0
//        
//        if state.selectedCurrency != nil {
//            applied += 1
//        }
//        
//        if state.selectedPaymentMethod != nil {
//            applied += 1
//        }
//        
//        if state.selectedSorting != Sorting.companion.default_ {
//            applied += 1
//        }
//        
//        return applied
//    }
//}

private struct SortingButton: View {
    @Environment(\.isEnabled) private var isEnabled
    let onClick: () -> Void
    
    var body: some View {
        Button(action: onClick, label: {
//            Image(uiImage: Asset.Illustrations.sorting.image)
//                .renderingMode(.template)
//                .resizable()
//                .frame(width: 15, height: 15)
//                .padding()
        })
        .buttonStyle(PickerButtonStyle(isEnabled: isEnabled, isPlaceholderVisible: false, style: .outlined))
    }
}
}

//#Preview {
//    ListingsFilterBar()
//}
