//
//  MyChatApp.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import SwiftUI
import Firebase

@main
struct MyChatApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContactsViewModel())
                .environmentObject(ChatViewModel())
        }
    }
}
