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
    
    static func getLoggedInUserPhone() -> String {
        return Auth.auth().currentUser?.phoneNumber ?? ""
    }
    
    static func logout() {
        // 로그아웃 오류 여부는 크게 신경안씀
        try? Auth.auth().signOut()
    }
    
    static func sendPhoneNumber(phone: String, completion: @escaping (Error?) -> Void) {
        
        // send the phone number to Firebase Auth
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationId, error in
            if error == nil {
                // got the verification id
                UserDefaults.standard.set(verificationId, forKey: "authVerificationID")
                
            }
            DispatchQueue.main.async {
                // notify the ui
                completion(error)
            }
        }
    }
    
    static func verifyCode(code: String, completion: @escaping (Error?) -> Void) {
        
        // 로컬저장소에서 인증id 가져오기
        let verificationId = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
        
        // 파베에 코드와 인증id 전송
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationId,
            verificationCode: code
        )
        
        // 유저 로그인
        Auth.auth().signIn(with: credential) { authResult, error in
            
            DispatchQueue.main.async {
                // ui에 알림 
                completion(error)
            }
        }
    }
}
