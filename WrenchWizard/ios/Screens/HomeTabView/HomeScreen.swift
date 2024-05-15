//
//  HomeScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
            VStack(spacing: 0) {
                GeometryReader { container in
                ZStack {
                    switch homeViewModel.activeTab {
                    case .home:
                        ExploreScreen()
                    case .myJobs:
                        EmptyView()
                    case .post:
                        EmptyView()
                    case .messages:
                        EmptyView()
                    case .account:
                        EmptyView()
                    }
                    
                }
                .padding(.leading, container.safeAreaInsets.leading)
                .padding(.trailing, container.safeAreaInsets.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //                .frame(height: 300)
            }
                HStack {
                    TabItem(
                        title: "Home",
                        image: Image(systemName: "house.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeTab == .home
                    )
                    .onTapGesture {
                        homeViewModel.activeTab = .home
                    }
                    Spacer()
                    TabItem(
                        title: "My Jobs",
                        image: Image(systemName: "doc.text.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeTab == .myJobs
                    )
                    .onTapGesture {
                        homeViewModel.activeTab = .myJobs
                    }
                    Spacer()
                    TabItem(
                        title: "Post",
                        image: Image(systemName: "plus.circle.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeTab == .post
                    )
                    .onTapGesture {
                        homeViewModel.activeTab = .post
                    }
                    Spacer()
                    TabItem(
                        title: "Message",
                        image: Image(systemName: "bolt.horizontal.circle.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeTab == .messages
                    )
                    .onTapGesture {
                        homeViewModel.activeTab = .messages
                    }
                    Spacer()
                    TabItem(
                        title: Strings.account,
                        image: Image(systemName: "person.fill"),
                        isNotificationVisible: true,
                        isSelected: homeViewModel.activeTab == .account
                    )
                    .onTapGesture {
                        homeViewModel.activeTab = .account
                    }
                }
                .ignoresSafeArea(.keyboard)
                .frame(height: 70)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .padding(.bottom)
                .background(Color.contentBackgroundSecondary.shadow(length: .short))
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
        
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
                    .font(Typography.regular(size: 12))
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
            return Color.gossamer
        } else {
            return Color.osloGray
        }
    }
}

#Preview {
    HomeScreen()
}
