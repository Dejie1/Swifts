//
//  MainMessageView.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MainMessageView: View {
    
    @State var shouldShowLogOutOptions = false
    @State var shouldShowNewMessageScreen = false
    @EnvironmentObject var userViewModel: UserViewModel
    @State var shouldNavigateToChatLogView = false
    @State var user: User?
    
    
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
                self.userViewModel.fetchRecentMessages()
            })
        })
    }
    
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    var body: some View {
        NavigationStack {
            VStack {
//                Text("Current UiD: \(userViewModel.user?.uid ?? "" )")
                customNavBar
                messagesView
            }
            
            .overlay(
                newMessageButton, alignment: .bottom)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $shouldNavigateToChatLogView){
                ChatLogView(vm: chatLogViewModel)
                    .environmentObject(UserViewModel())
            }
        }
        
    }
    
    private var messagesView: some View {
        ScrollView {
            ForEach(userViewModel.recentMessages) { recentMessage in
                VStack {
                    Button{
                        let uid = FirebaseManager.shared.auth.currentUser?.uid == recentMessage.fromId ? recentMessage.toId : recentMessage.fromId
                        
                        self.user = User(
                            id: uid,
                            uid: uid,
                            email: "placeholder@example.com",  // Placeholder email
                            profileImageUrl: recentMessage.profileImageUrl,
                            userType: "placeholderUserType",   // Placeholder userType
                            selectedCategories: nil,           // Optional, can be nil
                            hasSelectedCategories: false,      // Placeholder value
                            name: recentMessage.name,
                            about: nil,                        // Optional, can be nil
                            age: nil,                          // Optional, can be nil
                            uni: nil,                          // Optional, can be nil
                            course: nil                        // Optional, can be nil
                        )
                        
                        
                        self.chatLogViewModel.chatUser = self.user
                        self.chatLogViewModel.fetchMessages()
                        self.shouldNavigateToChatLogView.toggle()
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: recentMessage.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width:64, height:64)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(recentMessage.name)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(Color(.label))
                                Text(recentMessage.text)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.darkGray))
                            }
                            Spacer()
                            
                            Text(recentMessage.timeAgo)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
                
            }.padding(.bottom, 50)
        }
    }
    
    private var newMessageButton: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
        } label: {
            HStack {
                Spacer()
                Text("+ New Message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
                .background(Color.blue)
                .cornerRadius(32)
                .padding(.horizontal)
                .shadow(radius: 15)
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
            CreateNewMessageView(didSelectNewUser: {user
                in
                print (user.email)
                self.shouldNavigateToChatLogView.toggle()
                self.user = user
                self.chatLogViewModel.chatUser = user
                self.chatLogViewModel.fetchMessages()
            })
                .environmentObject(UserViewModel())
        }
    }
}


#Preview {
    MainMessageView()
        .environmentObject(UserViewModel())
//        .preferredColorScheme(.dark)
}
