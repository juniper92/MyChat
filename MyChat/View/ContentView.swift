//
//  ContentView.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    @State var isOnboarding = !AuthViewModel.isUserLoggedIn()
    
    var body: some View {
        VStack {
            
            Text("dd")
                .padding()
                .font(Font.chatHeading)
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .fullScreenCover(isPresented: $isOnboarding) {
            // On dismiss
        } content: {
            // the onboarding sequence
            OnboardingContainerView(isOnboarding: $isOnboarding)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
