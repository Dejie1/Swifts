//
//  ChatLogView.swift
//  Seasoned
//
//  Created by De Jie Ang on 6/6/2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    @DocumentID var id: String?
    let fromId, toId, text: String
    let timestamp: Date
}

struct ChatLogView: View {
    
    @ObservedObject var vm: ChatLogViewModel
    @State private var shouldPresentMentorMeetUp = false
    var body: some View {
        NavigationStack {
            ZStack {
                messagesView
                Text(vm.errorMessage)
            }
            .onDisappear(){
                vm.firestoreListener?.remove()
            }
            .navigationTitle(vm.chatUser?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        shouldPresentMentorMeetUp = true
                    }) {
                        Image(systemName: "person.line.dotted.person.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .fullScreenCover(isPresented: $shouldPresentMentorMeetUp) {
                MentorMeetUp(isPresented: $shouldPresentMentorMeetUp)
            }
        }
    }
    
    static let emptyScrollToString = "Empty"
    
    private var messagesView: some View {
        VStack {
            if #available(iOS 15.0, *){
                ScrollView {
                    ScrollViewReader { scrollViewProxy in
                        VStack {
                            ForEach(vm.chatMessages) { message in
                                MessageView(message: message)
                            }
                            
                            HStack{ Spacer() }
                                .id(Self.emptyScrollToString)
                        }
                        .onReceive(vm.$count) { _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                scrollViewProxy.scrollTo(Self.emptyScrollToString, anchor: .bottom)
                            }
                        }
                    }
                }
                .background(Color(.init(white: 0.95, alpha: 1)))
                .safeAreaInset(edge: .bottom) {
                    chatBottomBar
                        .background(Color(.systemBackground).ignoresSafeArea())
                }
            }
        }
    }
    
    private var chatBottomBar: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color.gray, lineWidth: 1) // Rounded border with a gray color and 1-point line width
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white)) // Fill the background with white color
                if vm.chatText.isEmpty {
                    DescriptionPlaceholder()
                }
                TextEditor(text: $vm.chatText)
                    .padding(8) // Add padding to create space between the text and the border
                    .opacity(vm.chatText.isEmpty ? 0.5 : 1)
                
            }
            .frame(height: 40)
            
            Button {
                vm.handleSend()
            } label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue)
            .cornerRadius(4)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}


//Showing different color of chat bubbles for sender and receiver
struct MessageView: View {
    
    let message: ChatMessage
    
    var body: some View {
        VStack {
            if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                HStack {
                    Spacer()
                    HStack {
                        Text(message.text)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
            } else {
                HStack {
                    HStack {
                        Text(message.text)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}


private struct DescriptionPlaceholder: View {
    var body: some View {
        HStack {
            Text(" Text")
                .foregroundColor(Color(.gray))
                .font(.system(size: 17))
                .padding(.leading, 9)
                .padding(.top, -2)
            Spacer()
        }
    }
}
