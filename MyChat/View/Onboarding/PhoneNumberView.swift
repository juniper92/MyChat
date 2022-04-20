//
//  PhoneNumberView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI
import Combine

struct PhoneNumberView: View {
    
    @Binding var currentStep: OnboardingStep
    @State var phoneNumber = ""
    
    var body: some View {
        
        VStack {
            Text("Verification")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("휴대폰 번호를 입력하면 인증 코드가 발송됩니다.")
                .font(Font.bodyText)
                .padding(.top, 12)
            
            // Textfield
            ZStack {
                Rectangle()
                    .frame(height: 56)
                    .foregroundColor(Color.Palette.TextBackground)
                
                HStack {
                    TextField("e.g. +82 10 1234 5678", text: $phoneNumber)
                        .font(Font.bodyText)
                        .keyboardType(.phonePad)
                        .onReceive(Just(phoneNumber)) { _ in
                            TextHelper.applyPatternOnNumbers(&phoneNumber, pattern: "+## ## ####-####", replacementCharacter: "#")
                        }
                    
                    Spacer()
                    
                    Button {
                        // 텍스트필드 클리어 
                        phoneNumber = ""
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
                // Firabase Auth로 전화번호 보내기
                AuthViewModel.sendPhoneNumber(phone: phoneNumber) { error in

                    // 에러체크
                    if error == nil {
                        // 다음 스텝
                        currentStep = .verification
                    } else {
                        // TODO: show an error

                    }
                }
                
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(currentStep: .constant(.phonenumber))
    }
}
