//
//  SyncContactsView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct SyncContactsView: View {
        
    @Binding var isOnboarding: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("i2")
                .resizable()
                .scaledToFit()
            
            Text("Awesome!")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("Continue to start chatting with your firends.")
                .font(Font.bodyText)
                .padding(.top, 8)
            
            Spacer()
            
            Button {
                // End Onboarding
                isOnboarding = false 
            } label: {
                Text("Continue")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
        }
        .padding(.horizontal)
    }
}

struct SyncContactsView_Previews: PreviewProvider {
    static var previews: some View {
        SyncContactsView(isOnboarding: .constant(true))
    }
}
