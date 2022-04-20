//
//  ContactRowView.swift
//  MyChat
//
//  Created by Mila on 2022/04/19.
//

import SwiftUI

struct ContactRowView: View {
    
    var user: User
    
    var body: some View {
        
        HStack(spacing: 24) {
            // profile image
            ProfilePicView(user: user)
            
            VStack(alignment: .leading, spacing: 4) {
                // name
                Text("\(user.firstname ?? "") \(user.lastname ?? "")")
                    .font(Font.button)
                    .foregroundColor(Color.Palette.IconsPrimary)
                
                // phone number
                Text(user.phone ?? "")
                    .font(Font.bodyText)
                    .foregroundColor(Color.Palette.TextInput)
            }
            
            Spacer()
        }
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(user: User())
    }
}
