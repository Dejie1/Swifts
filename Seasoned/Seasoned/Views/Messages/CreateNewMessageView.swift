//
//  NewMessageView.swift
//  Seasoned
//
//  Created by De Jie Ang on 6/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreateNewMessageView: View {
    
    let didSelectNewUser: (User)-> ()
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: UserViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(vm.errorMessage)
                
                ForEach(vm.users) { user in
                    Button { 
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(.label), lineWidth: 2)
                                )
                            Text(user.name)
                                .foregroundColor(Color(.label))
                            Spacer()
                        }.padding(.horizontal)
                    }
                    Divider()
                        .padding(.vertical, 8)
                    
                    
                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}
