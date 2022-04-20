//
//  CreateProfileView.swift
//  MyChat
//
//  Created by Mila on 2022/04/14.
//

import SwiftUI

struct CreateProfileView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var selectedImage: UIImage?
    @State var isPickerShowing: Bool = false
    
    @State var isSourceMenuShowing: Bool = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    
    @State var isSaveButtonDisabled: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Setup your Profile")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Just a few more details to get started.")
                .font(Font.bodyText)
                .padding(.top, 12)
            
            Spacer()
            
            // 프로필이미지 버튼
            Button {
                // 액션시트 출력
                isSourceMenuShowing = true
            } label: {
                
                ZStack {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                    else {
                        Circle()
                            .foregroundColor(.white)
                        
                        Image(systemName: "camera.fill")
                    }
                    Circle()
                        .stroke(lineWidth: 2)
                }
                .tint(Color.Palette.ButtonPrimary)
                .frame(width: 134, height: 134)
            }
            
            Spacer()
            
            // first name
            TextField("Given Name", text: $firstName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            // last name
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            Spacer()
            
            Button {
                
                // TODO: check that firstname/lastname fields are filled before allowing
                
                // 더블탭 방지
                isSaveButtonDisabled = true
                
                // 데이터 저장
                DatabaseService().setUserProfile(firstName: firstName,
                                                 lastName: lastName,
                                                 image: selectedImage) { isSuccess in
                    if isSuccess {
                        currentStep = .contacts
                    }
                    else {
                        // TODO: 사용자에게 오류 메시지 표시
                        
                    }
                    isSaveButtonDisabled = false
                }
                
            } label: {
                Text(isSaveButtonDisabled ? "프로필 업로드중.." : "저장")
            }
            .buttonStyle(OnboardingButtonStyle())
            .disabled(isSaveButtonDisabled)
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
        .confirmationDialog("From where?", isPresented: $isSourceMenuShowing, actions: {
            
            Button {
                // 포토 라이브러리 - 이미지피커 출력
                self.source = .photoLibrary
                isPickerShowing = true
            } label: {
                Text("포토 라이브러리")
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                Button {
                    // 카메라 - 이미지피커 출력
                    self.source = .camera
                    isPickerShowing = true
                } label: {
                    Text("사진 촬영")
                }
                
            }
        })
        .sheet(isPresented: $isPickerShowing) {
            // 이미지피커 출력
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, source: self.source)
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(currentStep: .constant(.profile))
    }
}
