//
//  DatabaseService.swift
//  MyChat
//
//  Created by Mila on 2022/04/16.
//

import Foundation
import Contacts
import Firebase
import UIKit

class DatabaseService {
    
    func getPlatformUsers(localContacts: [CNContact], completion: @escaping ([User]) -> Void) {
        
        // 검색된 플랫폼 사용자를 저장하는 배열
        var platformUsers = [User]()
        
        // 조회할 문자열 전화 번호 배열 구성
        var lookupPhoneNumbers = localContacts.map { contact in
            
            // 연락처를 전화 번호로 문자열로 변환
            return TextHelper.sanitizePhoneNumber(contact.phoneNumbers.first?.value.stringValue ?? "")
        }
        
        // 조회 번호가 있는지 확인
        guard lookupPhoneNumbers.count > 0 else {
            
            // 콜백
            completion(platformUsers)
            return
        }
        
        // 이 전화번호에 대한 데이터베이스 쿼리
        let db = Firestore.firestore()
        
        // 조회할 전화번호가 남아 있는 동안 쿼리 수행
        while !lookupPhoneNumbers.isEmpty {
            
            // 조회할 첫번째 < 10 개 전화번호 얻기
            let tenPhoneNumbers = Array(lookupPhoneNumbers.prefix(10))
            
            // 얻은 <10 개 번호 제거
            lookupPhoneNumbers = Array(lookupPhoneNumbers.dropFirst(10))
            
            // 처음 10개 찾기
            let query = db.collection("users").whereField("phone", in: tenPhoneNumbers)
            
            // 플랫폼에 있는 사용자 검색
            query.getDocuments { snapshot, error in
                
                // 오류 확인
                if error == nil && snapshot != nil {
                    
                    // 가져온 각 도큐먼트에 대한 사용자 생성
                    for doc in snapshot!.documents {
                        
                        if let user = try? doc.data(as: User.self) {
                            // 플랫폼사용자 배열에 추가
                            platformUsers.append(user)
                        }
                    }
                    
                    // 조회할 전화번호가 더 있는지 확인
                    // 그렇지 않다면, 컴플리션 블록에 콜하면 끝
                    if lookupPhoneNumbers.isEmpty {
                        // 해당 유저들 반환
                        completion(platformUsers)
                    }
                }
            }
        }
        
    }
    
    func setUserProfile(firstName: String, lastName: String, image: UIImage?, completion: @escaping (Bool) -> Void) {
        
        // 사용자가 로그인했는지 확인
        guard AuthViewModel.isUserLoggedIn() != false else {
            // 사용자가 로그인하지 않음
            return
        }
        
        // get user's phone number
        let userPhone = TextHelper.sanitizePhoneNumber(AuthViewModel.getLoggedInUserPhone())
        
        // 파이어스토어 참조
        let db = Firestore.firestore()
        
        // 프로필데이터 세팅
        let doc = db.collection("users").document(AuthViewModel.getLoggedInUserId())
        doc.setData(["firstname": firstName,
                     "lastname": lastName,
                     "phone": userPhone])
        
        // 이미지 통과 여부 확인
        if let image = image {
            
            // 스토리지 참조 생성
            let storageRef = Storage.storage().reference()
            
            // 이미지 데이터로 변환
            let imageData = image.jpegData(compressionQuality: 0.8)
            
            // 데이터로 변환 가능한지 확인
            guard imageData != nil else { return }
            
            // 파일 경로 및 이름지정
            let path = "images/\(UUID().uuidString).jpg"
            let fileRef = storageRef.child(path)
            
            let uploadTask = fileRef.putData(imageData!, metadata: nil) { meta, error in
                
                if error == nil && meta != nil {
                    
                    // get full url to image
                    fileRef.downloadURL { url, error in
                        
                        // check for errors
                        if url != nil && error == nil {
                            
                            // 프로필에 이미지경로 설정
                            doc.setData(["photo": url!.absoluteString], merge: true) { error in
                                if error == nil {
                                    // 성공
                                    completion(true)
                                }
                            }
                        }
                        else {
                            // wasn't successful in getting download url for photo
                            completion(false)
                        }
                    }
                }
                else {
                    // 업로드 실패
                    completion(false)
                }
            }
        }
        else {
            // no image was set
            completion(true)
        }
    }
    
    func checkUserProfile(completion: @escaping (Bool) -> Void) {
        
        // 유저가 로그인했는지 확인하기
        guard AuthViewModel.isUserLoggedIn() != false else {
            return
        }
        
        // 파베참조 생성
        let db = Firestore.firestore()
        
        db.collection("users").document(AuthViewModel.getLoggedInUserId()).getDocument { snapshot, error in
            
            // TODO: Keep the users profile data
            if snapshot != nil && error == nil {
                
                // 프로필이 있음을 알림
                completion(snapshot!.exists)
            }
            else {
                // TODO: look into using Result type to indicate failure vs profile exists
                completion(false)
            }
        }
    }
    
    
    // MARK: - Chat Methods
    
    /// 로그인한 사용자가 참여한 모든 채팅 도큐먼트 반환
    func getAllChats(completion: @escaping ([Chat]) -> Void) {
        
        // db참조
        
        // 사용자가 참여한 모든 채팅 컬렉션에 대해 쿼리 수행
        
        // Chat 구조체에서 데이터 파싱
        
        // 데이터 리턴
        
    }
}
