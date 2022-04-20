//
//  ConversationView.swift
//  MyChat
//
//  Created by Mila on 2022/04/19.
//

import SwiftUI

struct ConversationView: View {
    
    @Binding var isChatShowing: Bool
    @State var chatMessage = ""
    
    var body: some View {
        VStack {
            // MARK: - 헤더
            HStack {
                VStack(alignment: .leading, spacing: 16){
                    
                    Button {
                        isChatShowing = false
                        
                    } label: {
                        // 백버튼
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.Palette.ButtonPrimary)
                    }

                    // 이름
                    Text("SE3 살거야")
                        .font(Font.chatHeading)
                        .foregroundColor(Color.Palette.TextInput)
                }
                
                Spacer()
                
                // 프사
                ProfilePicView(user: User())
            }
            .padding(.horizontal)
            .frame(height: 104)
            
            // MARK: - 챗로그 
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: 상대방 메시지
                    HStack {
                        Text("도로로로롱")
                            .font(Font.bodyText)
                            .foregroundColor(Color.Palette.ChatInput)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                            .background(Color.Palette.IconsSecondary)
                            .cornerRadius(30, corners: [.topLeft, .topRight, .bottomRight])
                        
                        Spacer()
                        
                        Text("9:41")
                            .font(Font.smallText)
                            .foregroundColor(Color.Palette.TextInput)
                            .padding(.leading, 24)
                    }
                    
                    // MARK: 내 메시지
                    HStack {
                        
                        Text("9:45")
                            .font(Font.smallText)
                            .foregroundColor(Color.Palette.TextInput)
                            .padding(.trailing, 24)
                        
                        Spacer()
                        
                        Text("에베베베베베베엘질달다ㅣㄹ아러나러ㅣㅏ러ㅣㅓ리ㅏ너라ㅣㄴ러ㅣㅇ")
                            .font(Font.bodyText)
                            .foregroundColor(Color.Palette.ChatInput)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                            .background(Color.Palette.ButtonPrimary)
                            .cornerRadius(30, corners: [.topLeft, .topRight, .bottomLeft])
                    }

                }
                .padding(.horizontal)
                .padding(.top, 24)
            }
            .background(Color.Palette.Background)
            
            // MARK: - 채팅 메시지바
            ZStack {
                
                Color.Palette.Background
                    .ignoresSafeArea()
                
                HStack {
                    // MARK: 카메라버튼
                    Button {
                        
                    } label: {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(Color.Palette.IconsSecondary)
                    }

                    // MARK: 텍스트필드
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.Palette.TextBackground)
                            .cornerRadius(50)
                        
                        TextField("끄적끄적", text: $chatMessage)
                            .foregroundColor(Color.Palette.TextInput)
                            .font(Font.bodyText)
                            .padding(10)
                            .padding(.leading)
                        
                        
                        // MARK: 이모지버튼
                        HStack {
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "face.smiling")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color.Palette.IconsSecondary.opacity(0.7))
                            }
                        }
                        .padding(.trailing, 12)
                        
                    }
                    .frame(height: 44)
                    
                    // MARK: 보내기 버튼
                    Button {
                        // TODO: 메시지보내기
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(Color.Palette.ButtonPrimary)
                    }

                }
                .padding(.horizontal)
            }
            .frame(height: 76)

        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(isChatShowing: .constant(false))
    }
}
