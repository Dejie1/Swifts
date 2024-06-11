//
//  MentorRow.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MentorRow: View {
    var mentor: User
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: mentor.profileImageUrl))
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(mentor.name)
                    .font(.headline)
                Group {
                    Text("\(mentor.age ?? 0), ")
                    + Text(mentor.uni ?? "Unknown University")
                }
                .font(.subheadline)
                .foregroundColor(Color(.gray))
                Text(mentor.course ?? "Unknown Course")
                    .font(.subheadline)
                    .foregroundColor(Color(.gray))
            }
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing, 20)
        }
    }
}

struct MentorRow_Previews: PreviewProvider {
    static var previews: some View {
        MentorRow(mentor: User(
            uid: "123",
            email: "john.doe@example.com",
            profileImageUrl: "https://example.com/profile.jpg",
            userType: "Mentor",
            selectedCategories: ["Category1", "Category2"],
            hasSelectedCategories: true,
            name: "John Doe",
            about: "A brief description about John Doe.",
            age: 25,
            uni: "XYZ University",
            course: "Computer Science"
        ))
    }
}



