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
        
        private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
        
        var body: some View {
            NavigationStack {
                GeometryReader { geometry in
                    VStack {
                        customNavBar
                        messagesView
//                        NavigationLink(destination:ChatLogView(vm: chatLogViewModel), isActive: $shouldNavigateToChatLogView) {
//                        }
                    }
                    .overlay(
                        newMessageButton
                            .padding()
                            .position(x: geometry.size.width - 65, y: geometry.size.height - 40),
                        alignment: .bottomTrailing
                    )
                    .navigationBarHidden(true)
                    .navigationDestination(isPresented: $shouldNavigateToChatLogView) {
                        ChatLogView(vm: chatLogViewModel)
                            .environmentObject(userViewModel)
                    }
                    .navigationDestination(isPresented: $userViewModel.isUserCurrentlyLoggedOut) {
                        LoginView(didCompleteLoginProcess: {
                            self.userViewModel.isUserCurrentlyLoggedOut = false
                            self.userViewModel.fetchCurrentUser()
                            self.userViewModel.fetchRecentMessages()
                        })
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        
    private var customNavBar: some View {
        VStack {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Inbox")
                        .font(.system(size: 35, weight: .bold))
                }
                
                Spacer()
                Button {
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.system(size: 30, weight: .bold))
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
            Divider()
                .overlay(Color.black)
        }
    }
    
    
    private func messageText(recentMessage: RecentMessage) -> String {
        if let currentUserID = FirebaseManager.shared.auth.currentUser?.uid {
            return recentMessage.fromId == currentUserID ? "You: \(recentMessage.text)" : recentMessage.text
        }
        return recentMessage.text
    }
    
    private var messagesView: some View {
        ScrollView {
            VStack {
                if userViewModel.recentMessages.isEmpty {
                    Spacer()
                    Text("Click on the + Button and Chat!")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(.gray))
                    Spacer()
                } else {
                    ForEach(userViewModel.recentMessages) { recentMessage in
                        VStack {
                            Button {
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
                                        .frame(width: 64, height: 64)
                                        .overlay(RoundedRectangle(cornerRadius: 64)
                                                    .stroke(Color.black, lineWidth: 2))
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(recentMessage.name)
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundStyle(Color(.label))
                                            .padding(.bottom, 1)
                                        Text(messageText(recentMessage: recentMessage))
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
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.bottom, 50)
        }
    }

    private var newMessageButton: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
        } label: {
            HStack {
                Spacer()
                Text("+")
                    .font(.system(size: 30, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
                .background(Color.blue)
                .cornerRadius(19)
                .padding(.horizontal)
                .shadow(radius: 5)
        }
        .frame(width:100)
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
            CreateNewMessageView(didSelectNewUser: {user
                in
                print (user.email)
                self.shouldNavigateToChatLogView.toggle()
                self.user = user
                self.chatLogViewModel.chatUser = user
                self.chatLogViewModel.fetchMessages()
            })
                .environmentObject(userViewModel)
        }
    }
}


#Preview {
    MainMessageView()
        .environmentObject(UserViewModel())
}
