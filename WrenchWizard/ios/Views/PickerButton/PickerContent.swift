//
//  PickerContent.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/2/24.
//

import SwiftUI

struct PickerContent<I, ItemContent>: View where I: Hashable, ItemContent: View {
    
    var title: String
    var isSearchAllowed: Bool
    @Binding var searchTerm: String
    var items: [I]
    let itemContent: (I) -> ItemContent
    let onBackClicked: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                //                if #available(iOS 15, *) {
                ////                    EmptyView()
                //                    Button(action: onBackClicked, label: {
                //                        ToolbarImage(systemName: "chevron.backward")
                //                            .padding(.all, 16)
                //                    })
                //                } else {
                //                    Button(action: onBackClicked, label: {
                //                        ToolbarImage(systemName: "chevron.backward")
                //                            .padding(.all, 16)
                //                    })
                //                }
                
                //                Text(title)
                //                    .foregroundColor(Color.black)
                //                    .font(Typography.semiBold(size: 18))
                //                    .frame(maxWidth: .infinity, alignment: .center)
                //            }
                //            .frame(height: 53)
                //            .background(Color.ContentBackground.contentBackgroundPrimary)
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(items, id: \.self) { item in
                            itemContent(item)
                            Divider().padding(.horizontal, 8)
                        }
                    }
                }
            }
            .background(Color.ContentBackground.contentBackgroundSecondary)
            //        .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Renovation")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarBackButton(action: {})
                //            ToolbarTitle(title: "Renovation")
            }
        }
    }
}
