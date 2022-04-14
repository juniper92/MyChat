//
//  OnboardingButtonStyle.swift
//  MyChat
//
//  Created by Mila on 2022/04/15.
//

import Foundation
import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 50)
                .cornerRadius(4)
                .foregroundColor(Color.Palette.ButtonPrimary)
            
            configuration.label
                .font(Font.button)
                .foregroundColor(Color.Palette.TextButton)
        }
    }
}
