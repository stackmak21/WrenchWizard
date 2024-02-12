//
//  HomeContent.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        HomeContent(state: $viewModel.state)
    }
}

private struct HomeContent: View {
    @Binding var viewModel: HomeViewModel
    
    var body: some View{
        GeometryReader { container in
            VStack(spacing: 0) {
                ListingsFilterBar(
                    state: state
                )
                .padding(.top, container.safeAreaInsets.top)
                .padding(.leading, container.safeAreaInsets.leading)
                .padding(.trailing, container.safeAreaInsets.trailing)
                .background(Color.background.shadow(length: .long))
                .frame(alignment: .top)
                .zIndex(1)
            }
            
        }
    }
}

#Preview {
    HomeContent(state: .constant(<#T##value: HomeViewModel.State##HomeViewModel.State#>))
}
