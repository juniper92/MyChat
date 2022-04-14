//
//  CreateProfileTextfieldStyle.swift
//  MyChat
//
//  Created by Mila on 2022/04/15.
//

import Foundation
import SwiftUI

struct CreateProfileTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.Palette.TextBackground)
                .cornerRadius(8)
                .frame(height: 46)
            
            // 여기가 텍스트필드임
            configuration
                .font(Font.tabBar)
                .padding()
        }
    }
}
