//
//  ChatLogViewModel.swift
//  Seasoned
//
//  Created by De Jie Ang on 11/6/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SDWebImageSwiftUI


class ChatLogViewModel: ObservableObject {
    
    @Published var chatText = ""
    @Published var errorMessage = ""
    @Published var count = 0
    @Published var chatMessages = [ChatMessage]()
    var firestoreListener: ListenerRegistration?
    
    var chatUser: User?
    
    init(chatUser: User?) {
        self.chatUser = chatUser
        fetchMessages()
    }
    
    private func persistRecentMessages() {
        guard let chatUser = chatUser else { return }
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = self.chatUser?.uid else { return }
        
        let data = [
            FirebaseConstants.timestamp: Timestamp(),
            FirebaseConstants.text: self.chatText,
            FirebaseConstants.fromId: uid,
            FirebaseConstants.toId: toId,
            FirebaseConstants.profileImageUrl: chatUser.profileImageUrl,
            FirebaseConstants.name: chatUser.name
        ] as [String : Any]
        
        // Data for the current user
        let document = FirebaseManager.shared.firestore
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .document(toId)
        
        document.setData(data) { error in
            if let error = error {
                self.errorMessage = "Failed to save recent message: \(error)"
                print("Failed to save recent messages: \(error)")
                return
            }
            print("Successfully saved recent message for \(chatUser.name)")
        }
        
        // Retrieve the current user's name and profile image URL from Firestore
        let currentUserRef = FirebaseManager.shared.firestore.collection("users").document(uid)
        currentUserRef.getDocument { document, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user data: \(error)"
                print("Failed to fetch current user data: \(error)")
                return
            }
            
            guard let document = document, document.exists, let data = document.data() else {
                self.errorMessage = "Current user data not found"
                print("Current user data not found")
                return
            }
            
            let currentUserName = data["name"] as? String ?? ""
            let currentUserProfileImageUrl = data["profileImageUrl"] as? String ?? ""
            
            // Data for the recipient user
            let recipientData = [
                FirebaseConstants.timestamp: Timestamp(),
                FirebaseConstants.text: self.chatText,
                FirebaseConstants.fromId: uid,
                FirebaseConstants.toId: toId,
                FirebaseConstants.profileImageUrl: currentUserProfileImageUrl,
                FirebaseConstants.name: currentUserName
            ] as [String : Any]
            
            let recipientDocument = FirebaseManager.shared.firestore
                .collection("recent_messages")
                .document(toId)
                .collection("messages")
                .document(uid)
            
            recipientDocument.setData(recipientData) { error in
                if let error = error {
                    self.errorMessage = "Failed to save recent message for recipient: \(error)"
                    print("Failed to save recent message for recipient: \(error)")
                    return
                }
                print("Successfully saved recent message for recipient")
            }
        }
    }


    
    func fetchMessages() {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        firestoreListener?.remove()
        chatMessages.removeAll()
        firestoreListener = FirebaseManager.shared.firestore
            .collection(FirebaseConstants.messages)
            .document(fromId)
            .collection(toId)
            .order(by: FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        do {
                            let cm = try change.document.data(as: ChatMessage.self)
                                self.chatMessages.append(cm)
                                print("Appending chatMessage in ChatLogView: \(Date())")
                            
                        } catch {
                            print("Failed to decode message: \(error)")
                        }
                    }
                })
                
                DispatchQueue.main.async {
                    self.count += 1
                }
            }
    }
    
    func handleSend() {
        print(chatText)
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        
        let messageData = [
            FirebaseConstants.fromId: fromId,
            FirebaseConstants.toId: toId,
            FirebaseConstants.text: self.chatText,
            "timestamp": Timestamp()
        ] as [String : Any]
        
        // Save message for sender
        let document = FirebaseManager.shared.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        document.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            
            print("Successfully saved current user sending message")
            
            self.persistRecentMessages()
            self.chatText = ""
            self.count += 1
        }
        
        // Save message for recipient
        let recipientMessageDocument = FirebaseManager.shared.firestore.collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
        
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            
            print("Recipient saved message as well")
        }
    }

    
    
}
