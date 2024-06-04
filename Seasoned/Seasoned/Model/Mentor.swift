//
//  mentors.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Mentor: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var about: String
    var categories: [String]
    var age: Int
    var uni: String
    var course: String
    
    private var imageName: String
    var image: Image{
        Image (imageName)
    }
}
