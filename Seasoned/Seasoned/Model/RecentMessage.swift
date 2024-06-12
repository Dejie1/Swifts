//
//  RecentMessage.swift
//  Seasoned
//
//  Created by De Jie Ang on 7/6/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RecentMessage: Codable, Identifiable {
    @DocumentID var id: String?
    let text, name: String
    let fromId, toId: String
    let profileImageUrl: String
    let timestamp: Date
    
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
}
