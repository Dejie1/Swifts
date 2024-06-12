//
//  mentors.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct Mentor: Identifiable, Hashable, Codable {
    var id: String { uid }
    var uid: String
    var name: String
    var age: Int
    var uni: String
    var course: String
    var profileImageUrl: String
    
    // Custom initializer for initializing from a dictionary
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.age = data["age"] as? Int ?? 0
        self.uni = data["uni"] as? String ?? ""
        self.course = data["course"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
    
    // Computed property to generate an Image
    var image: Image {
        if let url = URL(string: profileImageUrl), let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "person.fill")
        }
    }
}
