//
//  VerficationView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct VerficationView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var verificationCode = ""
    
    var body: some View {
        
        VStack {
            Text("Verification")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Enter the 6-digit verification code we sent to your device.")
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
            
            
            // Next Step
            Button {
                currentStep = .profile
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
    }
}

struct VerficationView_Previews: PreviewProvider {
    static var previews: some View {
        VerficationView(currentStep: .constant(.verification))
    }
}
