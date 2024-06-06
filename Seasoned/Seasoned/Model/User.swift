//
//  User.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation

struct User: Identifiable {
    var id: String { uid }
    let uid: String
    let email: String
    let profileImageUrl: String
    let userType: String
    var selectedCategories: [String]?
    var hasSelectedCategories: Bool
    var name: String?
    var about: String?
    var age: Int?
    var uni: String?
    var course: String?
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.userType = data["userType"] as? String ?? ""
        self.selectedCategories = data["selectedCategories"] as? [String] ?? []
        self.hasSelectedCategories = data["hasSelectedCategories"] as? Bool ?? false
        self.name = data["name"] as? String ?? ""
        self.about = data["about"] as? String ?? ""
        self.age = data["age"] as? Int ?? nil
        self.uni = data["uni"] as? String ?? ""
        self.course = data["course"] as? String ?? ""
    }
}
