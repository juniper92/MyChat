//
//  PhoneNumberView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @Binding var currentStep: OnboardingStep
    @State var phoneNumber = ""
    
    var body: some View {
        
        VStack {
            Text("Verification")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Enter your mobile number below. We'll send you a verification code after.")
                .font(Font.bodyText)
                .padding(.top, 12)
            
            // Textfield
            ZStack {
                Rectangle()
                    .frame(height: 56)
                    .foregroundColor(Color.Palette.TextBackground)
                
                HStack {
                    TextField("e.g. +1 613 515 0123", text: $phoneNumber)
                        .font(Font.bodyText)
                    
                    Spacer()
                    
                    Button {
                        // Clear text field
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
            
            
            // Next Step
            Button {
                currentStep = .verification
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
