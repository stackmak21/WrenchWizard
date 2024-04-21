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
        GeometryReader { container in
            VStack(spacing: 0) {
                ZStack {
                    switch homeViewModel.activeScreen {
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
                
                HStack {
                    TabItem(
                        title: "Home",
                        image: Image(systemName: "house.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .home
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .home
                    }
                    Spacer()
                    TabItem(
                        title: "My Jobs",
                        image: Image(systemName: "doc.text.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .myJobs
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .myJobs
                    }
                    Spacer()
                    TabItem(
                        title: "Post",
                        image: Image(systemName: "plus.circle.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .post
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .post
                    }
                    Spacer()
                    TabItem(
                        title: "Message",
                        image: Image(systemName: "bolt.horizontal.circle.fill"),
                        isNotificationVisible: false,
                        isSelected: homeViewModel.activeScreen == .messages
                    )
                    .onTapGesture {
                        homeViewModel.activeScreen = .messages
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
                .background(Color.contentBackgroundSecondary.shadow(length: .short))
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
