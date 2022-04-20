//
//  VerficationView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI
import Combine

struct VerficationView: View {
    
    @Binding var currentStep: OnboardingStep
    @Binding var isOnboarding: Bool 
    
    @State var verificationCode = ""
    
    var body: some View {
        
        VStack {
            Text("본인인증")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("발송된 6자의 인증번호를 입력하세요.")
                .font(Font.bodyText)
                .padding(.top, 12)
            
            // Textfield
            ZStack {
                Rectangle()
                    .frame(height: 56)
                    .foregroundColor(Color.Palette.TextBackground)
                
                HStack {
                    TextField("", text: $verificationCode)
                        .font(Font.bodyText)
                        // 키보드타입 설정
                        .keyboardType(.numberPad)
                        .onReceive(Just(verificationCode)) { _ in
                            TextHelper.limitText(&verificationCode, 6)
                        }
                    
                    Spacer()
                    
                    Button {
                        verificationCode = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                    .frame(width: 19, height: 19)
                    .tint(Color.Palette.IconsPrimary)
                }
                .padding()
            }
            .padding(.top, 34)
            
            Spacer()
            
            Button {
                // 파베에서 인증코드 보내기
                AuthViewModel.verifyCode(code: verificationCode) { error in
                    // 에러첵
                    if error == nil {
                        
                        // 유저가 프로필 있는지 확인
                        DatabaseService().checkUserProfile { exists in
                            if exists {
                                // 온보딩 끝남 
                                isOnboarding = false
                            }
                            else {
                                currentStep = .profile
                            }
                        }
                        
                    } else {
                        // TODO: 에러출력
                    }
                }
                
            } label: {
                Text("다음으로")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
    }
}

struct VerficationView_Previews: PreviewProvider {
    static var previews: some View {
        VerficationView(currentStep: .constant(.verification), isOnboarding: .constant(true))
    }
}
