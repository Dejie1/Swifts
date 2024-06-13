//
//  UserData.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation

//Interacts with Firebase to get data
class UserManager {
    static let shared = UserManager()
    
    var currentUser: User?
    var errorMessage: String?
    
    private init() {}
    
    //Fetch current user
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
                
                guard let snapshot = snapshot, snapshot.exists else {
                    self.errorMessage = "No data found"
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data found"])))
                    return
                }
                
                do {
                    let user = try snapshot.data(as: User.self)
                    self.currentUser = user
                    FirebaseManager.shared.currentUser = user // Set the shared current user here
                    completion(.success(user))
                } catch let error {
                    self.errorMessage = "Failed to decode user: \(error)"
                    print("Failed to decode user:", error)
                    completion(.failure(error))
                }
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
    
    //Update/upload Selected categories by the user
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
    
    //Fetch all mentors
    func fetchMentors(forCategories categories: [String], completion: @escaping ([User]) -> Void) {
        FirebaseManager.shared.firestore.collection("users").whereField("userType", isEqualTo: "Mentor").getDocuments { snapshot, error in
            if let error = error {
                print("Failed to fetch mentors:", error)
                completion([])
                return
            }
            
            let mentors = snapshot?.documents.compactMap { document -> User? in
                do {
                    let user = try document.data(as: User.self)
                    let userCategories = user.selectedCategories ?? []
                    if userCategories.contains(where: categories.contains) {
                        return user
                    }
                    return nil
                } catch {
                    print("Failed to decode user mento: \(error)")
                    return nil
                }
            } ?? []
            
            completion(mentors)
        }
    }
    
    //Upload user details from UserDetailsView
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
