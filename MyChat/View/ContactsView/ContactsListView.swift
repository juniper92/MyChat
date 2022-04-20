//
//  ContactsListView.swift
//  MyChat
//
//  Created by Mila on 2022/04/18.
//

import SwiftUI

struct ContactsListView: View {
    
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    @Binding var isChatShowing: Bool
    
    @State var filterText = ""
    
    var body: some View {
        
        VStack {
            // 헤더
            HStack {
                Text("Contacts")
                    .font(Font.pageTitle)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.Palette.IconsSecondary)
                }
            }
            .padding(.top, 20)
            
            // 서치바
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color.Palette.TextBackground)
                    .cornerRadius(20)
                TextField("연락처 검색하기", text: $filterText)
                    .foregroundColor(Color.Palette.TextInput)
                    .font(Font.tabBar)
                    .padding()
            }
            .frame(height: 46)
            .onChange(of: filterText) { _ in
                // filter the results
                contactsViewModel.filterContacts(filterBy: filterText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
            }
            
            
            if contactsViewModel.filteredUsers.count > 0 {
//                 리스트
                List(contactsViewModel.filteredUsers) { user in
                    
                    Button {
                        // TODO: Display conversation view
                        isChatShowing = true
                        
                    } label: {
                        // display rows
                        ContactRowView(user: user)
                    }
                    .buttonStyle(.plain)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .padding(.top, 12)
            }
            
            else {
                Spacer()
                                
                Text("연락할 수 있는 사람이 없어요😭")
                    .font(Font.titleText)
                    .padding(.top, 32)
                
                Text("휴대폰에 연락처를 저장해보세요!")
                    .font(Font.bodyText)
                    .padding(.top, 8)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .onAppear {
            // get local contacts
            contactsViewModel.getLocalContacts()
        }
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(isChatShowing: .constant(false))
    }
}
