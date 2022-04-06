//
//  AuthViewModel.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    static func isUserLoggedIn() -> Bool {
        // currentUser가 nil이 아니면, currentUser가 있고 로그인되어 있음을 의미
        // currentUser가 nil이면, false 반환
        return Auth.auth().currentUser != nil
    }
    
    static func getLoggedInUserId() -> String {
        // currentUser가 nil이면 빈 문자열 반환 
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    static func logout() {
        // 로그아웃 오류 여부는 크게 신경안씀
        try? Auth.auth().signOut()
    }
}
