//
//  HomeScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var homeViewModel: HomeViewModel
    @StateObject private var exploreViewModel : ExploreViewModel
    
    init() {
        _homeViewModel = StateObject(wrappedValue: HomeViewModel())
        _exploreViewModel = StateObject(wrappedValue: ExploreViewModel())
    }
    
    var body: some View {
        GeometryReader { container in
            VStack(spacing: 0) {
                ZStack {
                    switch homeViewModel.activeScreen {
                    case .home:
                        ExploreScreen(viewModel: exploreViewModel)
                    case .search:
                        ExploreScreen(viewModel: exploreViewModel)
                    case .account:
                        ExploreScreen(viewModel: exploreViewModel)
                    case .mechanic:
                        ExploreScreen(viewModel: exploreViewModel)
                    }
                   
                }
                .padding(.leading, container.safeAreaInsets.leading)
                .padding(.trailing, container.safeAreaInsets.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    TabItem(
                        title: Strings.pap,
                        image: Image(systemName: "house.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .home
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .home
                    }
                    Spacer()
                    TabItem(
                        title: Strings.mechanic,
                        image: Image(systemName: "wrench.and.screwdriver"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .mechanic
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .mechanic
                    }
                    Spacer()
                    TabItem(
                        title: Strings.search,
                        image: Image(systemName: "plus.square.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .search
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .search
                    }
                    Spacer()
                    TabItem(
                        title: Strings.account,
                        image: Image(systemName: "person.fill"),
                        isNotificationVisible: true,
                        isSelected: homeViewModel.activeScreen == .account
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .account
                    }
                }
                .frame(height: 70)
                .padding(.leading, 16 + container.safeAreaInsets.leading)
                .padding(.trailing, 16 + container.safeAreaInsets.trailing)
                .padding(.bottom, container.safeAreaInsets.bottom)
                .background(Color.ContentBackground.contentBackgroundSecondary.shadow(length: .short))
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
        }
    }
}

private struct TabItem: View {
    
    var title: String
    var image: Image
    var isNotificationVisible: Bool
    var isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 6) {
                image
                    .renderingMode(.template)
                Text(title)
                    .font(Typography.regular(size: 10))
            }
            .foregroundColor(color)
            if isNotificationVisible {
                Circle()
                    .fill(Color.red)
                    .frame(width: 6, height: 6)
            }
        }
    }
    
    private var color: Color {
        if isSelected {
            return Color.primary
        } else {
            return Color.primary
        }
    }
}

#Preview {
    HomeScreen()
}
