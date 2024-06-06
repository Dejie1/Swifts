//
//  MainMessageView.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainMessageView: View {
    
    @State var shouldShowLogOutOptions = false
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    private var customNavBar: some View {
        HStack(spacing: 16) {
            
            WebImage(url:  URL(string: userViewModel.user? .profileImageUrl ?? ""))
                .resizable()
                .frame(width:55, height:55 )
                .clipShape(Circle())
             
//            Image(systemName: "person.fill")
//                .font(.system(size: 34, weight: .heavy))
            
            VStack(alignment: .leading, spacing: 4) {
                
                
                Text("\(userViewModel.displayName)")
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }
                
            }
            
            Spacer()
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    userViewModel.handleSignOut()
                }),
                    .cancel()
            ])
        }
        .fullScreenCover(isPresented: $userViewModel.isUserCurrentlyLoggedOut, onDismiss: nil, content: {
            LoginView(didCompleteLoginProcess: {
                self.userViewModel.isUserCurrentlyLoggedOut = false
                self.userViewModel.fetchCurrentUser()
            })
        })
    }
    
    var body: some View {
        NavigationView {
             
            VStack {
//                Text("Current User Type:  \(userViewModel.user?.userType ?? "")")
                Text("Current UiD: \(userViewModel.user?.uid ?? "" )")
                customNavBar
                messagesView
            }
//            .overlay(
//                newMessageButton, alignment: .bottom)
//            .navigationBarHidden(true)
        }
    }
    
    private var messagesView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 32))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 44)
                                        .stroke(Color(.label), lineWidth: 1)
                            )
                        
                        
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 16, weight: .bold))
                            Text("Message sent to user")
                                .font(.system(size: 14))
                                .foregroundColor(Color(.lightGray))
                        }
                        Spacer()
                        
                        Text("22d")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
                
            }.padding(.bottom, 50)
        }
    }
    
//    private var newMessageButton: some View {
//        Button {
//            
//        } label: {
//            HStack {
//                Spacer()
//                Text("+ New Message")
//                    .font(.system(size: 16, weight: .bold))
//                Spacer()
//            }
//            .foregroundColor(.white)
//            .padding(.vertical)
//                .background(Color.blue)
//                .cornerRadius(32)
//                .padding(.horizontal)
//                .shadow(radius: 15)
//        }
//    }
}
#Preview {
    MainMessageView()
        .environmentObject(UserViewModel())
//        .preferredColorScheme(.dark)
}
