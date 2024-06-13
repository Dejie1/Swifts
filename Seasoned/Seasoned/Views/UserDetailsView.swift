//
//  UserDetailsView.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import SwiftUI

struct UserDetailsView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var name: String = ""
    @State private var about: String = ""
    @State private var age: Int = 18
    @State private var uni: String = ""
    @State private var course: String = ""
    
    @State private var errorMessage: String?
    @State private var isUploading = false
    @State private var isUploadSuccessful = false
    @State private var showSupportPage = false
    @State private var selectedTab: Int = 0
    let ageRange = Array(18...100)
    let uniRange = ["RMIT","UTS","USYD","UNSW","ACU"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Enter your details ")) {
                    TextField("Name", text: $name)
                    
                    ZStack(alignment: .leading) {
                        if about.isEmpty {
                            Text("About")
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, 8)
                                .offset(y:-32)
                        }
                        TextEditor(text: $about)
                            .frame(height: 100)
                            .padding(4)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.vertical, 5)
                    
                    Picker("Age", selection: $age) {
                        ForEach(ageRange, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker("University", selection: $uni){
                        ForEach(uniRange, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
//                    TextField("University", text: $uni)
                    TextField("Course", text: $course)
                }
                
                Button(action: {
                    isUploading = true
                    uploadUserDetails()
                }) {
                    Text("Finish Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(isUploading)
                .alert(isPresented: $isUploadSuccessful) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Your details have been uploaded successfully."),
                        dismissButton: .default(Text("OK"), action: {
                            showSupportPage = true
                        })
                    )
                }
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .navigationBarTitle("Enter your details", displayMode: .inline)
//            .padding()
        }
        .navigationDestination(isPresented: $showSupportPage){
            if viewModel.user?.userType == "Student" {
                ContentView(selectedTab: $selectedTab)
                    .environmentObject(viewModel)
                    .navigationBarBackButtonHidden(true)
            } else if viewModel.user?.userType == "Mentor" {
                SupportAreaView()
                    .environmentObject(viewModel)
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
    
    private func uploadUserDetails() {
        isUploading = true
        UserManager.shared.uploadUserDetails(name: name, about: about, age: age, uni: uni, course: course) { result in
            isUploading = false
            switch result {
            case .success:
                isUploadSuccessful = true
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
            .environmentObject(UserViewModel())
    }
}


