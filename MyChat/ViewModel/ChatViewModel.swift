//
//  ChatViewModel.swift
//  MyChat
//
//  Created by Mila on 2022/04/20.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var chats = [Chat]()
    var databaseService = DatabaseService()
    
    init() {
        // ChatViewModel이 생성될 때 채팅 검색
        getChats()
    }
    
    func getChats() {
        // db를 사용해 채팅 검색
        databaseService.getAllChats { chats in
            
            // 검색된 데이터를 채팅 프로퍼티에 설정
            // chats가 Published 프로퍼티이기 때문에
            self.chats = chats
        }
    }
}
