//
//  WelcomeView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var currentStep: OnboardingStep
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image("i1")
                .resizable()
                .scaledToFit()
            
            Text("채팅 앱")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("안녕하세요 채팅앱이에요")
                .font(Font.bodyText)
                .padding(.top, 8)
            
            Spacer()
            
            Button {
                currentStep = .phonenumber
            } label: {
                Text("시작하기")
            }
            .buttonStyle(OnboardingButtonStyle())
            
            Text("'시작하기'를 클릭하면 이용약관에 동의한 것으로 간주함")
                .font(Font.smallText)
                .padding(.top, 14)
                .padding(.bottom, 61)
        }
        .padding(.horizontal)
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(currentStep: .constant(.welcome))
    }
}
