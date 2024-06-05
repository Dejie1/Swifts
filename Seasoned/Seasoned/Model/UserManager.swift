//
//  UserData.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    var currentUser: User?
    var errorMessage: String?
    
    private init() {}
    
    func fetchCurrentUser(completion: @escaping (Result<User, Error>) -> Void) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not find firebase uid"])))
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                completion(.failure(error))
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data found"])))
                return
            }
            
            let user = User(data: data)
            self.currentUser = user
            completion(.success(user))
        }
    }
    
    func handleSignOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try FirebaseManager.shared.auth.signOut()
            self.currentUser = nil
            completion(.success(()))
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            completion(.failure(signOutError))
        }
    }
    
    func updateSelectedCategories(_ categories: [String], completion: @escaping (Result<Void, Error>) -> Void) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not find firebase uid"])))
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).updateData(["selectedCategories": categories, "hasSelectedCategories": true]) { error in
            if let error = error {
                print("Failed to update selected categories:", error)
                completion(.failure(error))
            } else {
                print("Successfully updated selected categories")
                completion(.success(()))
            }
        }
    }
    
    func fetchMentors(forCategories categories: [String], completion: @escaping ([User]) -> Void) {
        FirebaseManager.shared.firestore.collection("users").whereField("userType", isEqualTo: "Mentor").getDocuments { snapshot, error in
            if let error = error {
                print("Failed to fetch mentors:", error)
                completion([])
                return
            }
            
            let mentors = snapshot?.documents.compactMap { document -> User? in
                let data = document.data()
                let user = User(data: data)
                let userCategories = user.selectedCategories ?? []
                if userCategories.contains(where: categories.contains) {
                    return user
                }
                return nil
            } ?? []
            
            completion(mentors)
        }
    }
    
    func uploadUserDetails(name: String, about: String, age: Int, uni: String, course: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not find firebase uid"])))
            return
        }
        
        let userDetails: [String: Any] = [
            "uid": uid,
            "name": name,
            "about": about,
            "age": age,
            "uni": uni,
            "course": course
        ]
        
        FirebaseManager.shared.firestore.collection("users").document(uid).setData(userDetails, merge: true) { error in
            if let error = error {
                print("Failed to upload user details:", error)
                completion(.failure(error))
            } else {
                print("Successfully uploaded user details")
                completion(.success(()))
            }
        }
    }    
}
