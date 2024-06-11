//
//  MentorRow.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct MentorRow: View {
    var mentor:Mentor
    
    var body: some View {
        
        HStack {
            mentor.image
                .resizable()
                .frame(width: 70,height: 70)
                .clipShape(Circle())
            
            VStack (alignment:.leading){
                Text(mentor.name)
                Group{
                    Text("\(mentor.age), ")
                    + Text(mentor.uni)
                    Text(mentor.course)
                }
                .font(.subheadline)
                .foregroundColor(Color(.gray))
            }
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing,20)
        }
    }
}

#Preview ("Turtle Rock") {
    Group{
        MentorRow(mentor: mentors[1])
    }
}
