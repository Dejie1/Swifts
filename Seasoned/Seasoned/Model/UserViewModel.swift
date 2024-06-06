//
//  UserViewModel.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

class UserViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var isUserCurrentlyLoggedOut = false
    @Published var mentors: [User] = []
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        fetchCurrentUser()
    }
    
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

    func fetchMentors(forCategories categories: [String]) {
        UserManager.shared.fetchMentors(forCategories: categories) { [weak self] mentors in
            DispatchQueue.main.async {
                self?.mentors = mentors
            }
        }
    }
    
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

