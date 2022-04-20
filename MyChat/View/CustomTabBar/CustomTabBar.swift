//
//  CustomTabBar.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import SwiftUI

enum Tabs: Int {
    case chats = 0
    case contacts = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                selectedTab = .chats
            } label: {
                TabBarButton(buttonText: "채팅", imageName: "bubble.left", isActive: selectedTab == .chats)
            }
            .tint(Color.Palette.IconsSecondary)
            
            Button {
                // MARK: - 현재 로그아웃버튼으로 활용중..
                AuthViewModel.logout()
            } label: {
                VStack(alignment: .center, spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            .tint(Color.Palette.IconsPrimary)

            
            Button {
                selectedTab = .contacts
            } label: {
                
                TabBarButton(buttonText: "연락처", imageName: "person", isActive: selectedTab == .contacts)
            }
            .tint(Color.Palette.IconsSecondary)

        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.contacts))
    }
}
