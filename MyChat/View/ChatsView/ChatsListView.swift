//
//  ChatsListView.swift
//  MyChat
//
//  Created by Mila on 2022/04/18.
//

import SwiftUI

struct ChatsListView: View {
    
    @EnvironmentObject var chatViewModel: ChatViewModel
    
    var body: some View {
        
        if chatViewModel.chats.count > 0 {
            
            List(chatViewModel.chats) { chat in
                
                Text(chat.id ?? "채팅id 없음")
            }
            
        } else {
            Text("채팅 없어!!!!!")
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView()
    }
}
