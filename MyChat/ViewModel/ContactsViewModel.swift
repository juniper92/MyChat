//
//  ContactsViewModel.swift
//  MyChat
//
//  Created by Mila on 2022/04/16.
//

import Foundation
import Contacts

// 연락처 가져오기를 완료하고 표시할 때마다, 자동으로 업데이트된다.
class ContactsViewModel: ObservableObject {
    
    private var users = [User]()
    
    private var filterText = ""
    @Published var filteredUsers = [User]()
    
    private var localContacts = [CNContact]()
    
    func getLocalContacts() {
        
        // 비동기 - UI 블락되지 않게
        DispatchQueue.init(label: "getcontacts").async {
            do {
                // 권한 요청
                let store = CNContactStore()
                
                // 필요한 키 리스트
                let keys = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey] as [CNKeyDescriptor]
                
                // fetchRequest 만들기
                let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                
                // 유저 폰에서 연락쳐 가져오기
                try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, success in
                    
                    self.localContacts.append(contact)
                })
                
                // 이 앱의 실제 사용자인 로컬 연락처 보기
                DatabaseService().getPlatformUsers(localContacts: self.localContacts) { platformUsers in
                    
                    // 메인 스레드에서 UI 업데이트
                    DispatchQueue.main.async {
                        // 가져온 사용자를 게시된 사용자 속성으로 설정
                        self.users = platformUsers
                        
                        // set the filtered list
                        self.filterContacts(filterBy: self.filterText)
                        
                    }
                }
            }
            catch {
                // 에러 핸들링
            }
        }

    }
    
    func filterContacts(filterBy: String) {
        
        // 매개변수 프로퍼티에 저장
        self.filterText = filterBy
        
        // 필터 텍스트 비어있으면 모든 사용자 표시하기
        if filterText == "" {
            self.filteredUsers = users
            return
        }
        
        // 필터링된 사용자 목록 가져오기
        self.filteredUsers = users.filter({ user in
            
            user.firstname?.lowercased().contains(filterText) ?? false ||
            user.lastname?.lowercased().contains(filterText) ?? false ||
            user.phone?.lowercased().contains(filterText) ?? false
        })
    }
}
