//
//  UserViewModel.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
import SDWebImageSwiftUI

class UserViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var isUserCurrentlyLoggedOut = false
    @Published var mentors: [User] = []
    @Published var users = [User]()
    @Published var recentMessages = [RecentMessage]()
    
    private var firestoreListener: ListenerRegistration?
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        fetchCurrentUser()
        fetchAllUsers()
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }

        firestoreListener?.remove()
        self.recentMessages.removeAll()

        firestoreListener = FirebaseManager.shared.firestore
            .collection(FirebaseConstants.recentMessages)
            .document(uid)
            .collection(FirebaseConstants.messages)
            .order(by: FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for recent messages: \(error)"
                    print(error)
                    return
                }

                querySnapshot?.documentChanges.forEach({ change in
                    let docId = change.document.documentID

                    if let index = self.recentMessages.firstIndex(where: { rm in
                        return rm.id == docId
                    }) {
                        self.recentMessages.remove(at: index)
                    }

                    do {
                        
                        let rm = try change.document.data(as: RecentMessage.self)
                        self.recentMessages.insert(rm, at: 0)
                    } catch {
                        print("Failed to decode RecentMessage: \(error)")
                    }
                })
            }
    }

    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users: \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach { snapshot in
                    do {
                        let user = try snapshot.data(as: User.self)
                        if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                            self.users.append(user)
                        }
                    } catch {
                        print("Failed to decode all user: \(error)")
                    }
                }
            }
    }
    
    //Calls User Manager to fetch current user
    func fetchCurrentUser(completion: ((Result<User, Error>) -> Void)? = nil) {
        UserManager.shared.fetchCurrentUser { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.user = user
                    self?.errorMessage = ""
                    completion?(.success(user))
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch current user: \(error.localizedDescription)"
                    print("Failed to fetch current user:", error)
                    completion?(.failure(error))
                }
            }
        }
    }



    //Calls User Manager to fetch mentors
    func fetchMentors(forCategories categories: [String]) {
        UserManager.shared.fetchMentors(forCategories: categories) { [weak self] mentors in
            DispatchQueue.main.async {
                self?.mentors = mentors
            }
        }
    }
    
    
    //Calls User Manager Sign Out function 
    func handleSignOut() {
        UserManager.shared.handleSignOut { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.isUserCurrentlyLoggedOut = true
                    self?.user = nil
                case .failure(let error):
                    self?.errorMessage = "Failed to sign out: \(error.localizedDescription)"
                    print("Failed to sign out:", error)
                }
            }
        }
    }
    
    //Calls User Manager to update selected Categories
    func updateSelectedCategories(_ categories: [String], completion: @escaping (Result<Void, Error>) -> Void) {
        UserManager.shared.updateSelectedCategories(categories) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.fetchCurrentUser() { fetchResult in
                        switch fetchResult {
                        case .success:
                            completion(.success(()))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    self?.errorMessage = "Failed to update categories: \(error.localizedDescription)"
                    completion(.failure(error))
                }
            }
        }
    }
    
    var displayName: String {
        return user?.name ?? "User"
    }
}

