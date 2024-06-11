//
//  User.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let uid: String
    let email: String
    let profileImageUrl: String
    let userType: String
    var selectedCategories: [String]?
    var hasSelectedCategories: Bool?
    var name: String
    var about: String?
    var age: Int?
    var uni: String?
    var course: String?
    
}
