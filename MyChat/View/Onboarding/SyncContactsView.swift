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
            
            Text("설정 끝!")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("채팅을 시작합니다.")
                .font(Font.bodyText)
                .padding(.top, 8)
            
            Spacer()
            
            Button {
                // 온보딩 끝
                isOnboarding = false 
            } label: {
                Text("시작하기")
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
