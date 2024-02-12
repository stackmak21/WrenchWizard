//
//  HomeScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import SwiftUI

struct TabView: View {
    
    @StateObject private var viewModel: TabViewModel
    @StateObject private var homeViewModel : HomeViewModel
    @StateObject private var mechanicViewModel: MechanicViewModel
    @StateObject private var searchViewModel: SearchViewModel
    @StateObject private var accountViewModel: AccountViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: TabViewModel())
        _homeViewModel = StateObject(wrappedValue: HomeViewModel())
        _mechanicViewModel = StateObject(wrappedValue: MechanicViewModel())
        _searchViewModel = StateObject(wrappedValue: SearchViewModel())
        _accountViewModel = StateObject(wrappedValue: AccountViewModel())
    }
    
    var body: some View {
        GeometryReader { container in
            VStack(spacing: 0) {
                ZStack {
                    switch viewModel.activeScreen {
                    case .home:
                        HomeScreen(viewModel: homeViewModel)
                    case .search:
                        SearchScreen(viewModel: searchViewModel)
                    case .account:
                        AccountScreen(viewModel: accountViewModel)
                    case .mechanic:
                        MechanicScreen(viewModel: mechanicViewModel)
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
                        isSelected: viewModel.activeScreen == .home
                    )
                    .onTapGesture {
                        viewModel.activeScreen = .home
                    }
                    Spacer()
                    TabItem(
                        title: Strings.mechanic,
                        image: Image(systemName: "wrench.and.screwdriver"),
                        isNotificationVisible: false,
                        isSelected: viewModel.activeScreen == .mechanic
                    )
                    .onTapGesture {
                        viewModel.activeScreen = .mechanic
                    }
                    Spacer()
                    TabItem(
                        title: Strings.search,
                        image: Image(systemName: "magnifyingglass"),
                        isNotificationVisible: false,
                        isSelected: viewModel.activeScreen == .search
                    )
                    .onTapGesture {
                        viewModel.activeScreen = .search
                    }
                    Spacer()
                    TabItem(
                        title: Strings.account,
                        image: Image(systemName: "person.fill"),
                        isNotificationVisible: false,
                        isSelected: viewModel.activeScreen == .account
                    )
                    .onTapGesture {
                        viewModel.activeScreen = .account
                    }
                }
                .frame(height: 70)
                .padding(.leading, 16 + container.safeAreaInsets.leading)
                .padding(.trailing, 16 + container.safeAreaInsets.trailing)
                .padding(.bottom, container.safeAreaInsets.bottom)
                .background(Color.contentBackgroundSecondary.shadow(length: .short))
            }
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
            return Color.primary.opacity(0.25)
        }
    }
}

#Preview {
    TabView()
}
