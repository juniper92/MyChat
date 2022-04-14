//
//  CreateProfileView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct CreateProfileView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var firstName = ""
    @State var lastName = ""
    
    var body: some View {
        
        VStack {
            Text("Setup your Profile")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Just a few more details to get started.")
                .font(Font.bodyText)
                .padding(.top, 12)
            
            Spacer()
            
            // Profile image button
            Button {
                // show action sheet
            } label: {
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    
                    Circle()
                        .stroke(lineWidth: 2)
                    
                    Image(systemName: "camera.fill")
                }
                .tint(Color.Palette.ButtonPrimary)
                .frame(width: 134, height: 134)
            }
            
            Spacer()
            
            // first name
            TextField("Given Name", text: $firstName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            // last name
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            Spacer()
            
            // Next Step
            Button {
                currentStep = .contacts
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
        
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(currentStep: .constant(.profile))
    }
}
