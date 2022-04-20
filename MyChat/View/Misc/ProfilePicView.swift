//
//  ProfilePicView.swift
//  MyChat
//
//  Created by Mila on 2022/04/19.
//

import SwiftUI

struct ProfilePicView: View {
    
    var user: User
    
    var body: some View {
        
        ZStack {
            // check if user has a photo set
            if user.photo == nil {
                
                // 이름 첫 글자로 프로필 표시하기
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    
                    Text(user.firstname?.prefix(1) ?? "")
                        .bold()
                        .foregroundColor(Color.Palette.IconsPrimary)
                }
            }
            else {
                // create url from user photo url
                let photoUrl = URL(string: user.photo ?? "")
                
                AsyncImage(url: photoUrl) { phase in
                    
                    switch phase {
                        
                    case .empty:
                        // 가져오는중..
                        ProgressView()
                        
                    case .success(let image):
                        // 가져온 이미지 표시
                        image
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .clipped()
                        
                    case .failure:
                        // 프로필사진 가져올 수 없음
                        // 이름 첫 글자로 프로필 표시하기
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                            
                            Text(user.firstname?.prefix(1) ?? "")
                                .bold()
                                .foregroundColor(Color.Palette.IconsPrimary)
                        }
                    }
                }
            }
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.Palette.IconsPrimary)
        }
        .frame(width: 44, height: 44)
        .tint(Color.Palette.IconsPrimary)
    }
}

struct ProfilePicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicView(user: User())
    }
}
