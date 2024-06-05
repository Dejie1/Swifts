//
//  MentorHomeScreen.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

struct MentorHomeScreen: View {
    var body: some View {
       
        Text("Welcome Mentor")
            .padding()
        VStack {
            HStack {
                Text("Upcoming MeetUps")
                    .font(.title2)
                
                Spacer()
                
            }
            .padding(.horizontal)
            VStack {
                VStack {
                    StudentRow(image: "placeholder",
                               studentName: "Student Name",
                               meetUpTime: "10am Tuesday 26 June")
                    
                    StudentRow(image: "placeholder",
                               studentName: "Student Name",
                               meetUpTime: "10am Tuesday 26 June")
                    
                    StudentRow(image: "placeholder",
                               studentName: "Student Name",
                               meetUpTime: "10am Tuesday 26 June")
                }
                .padding(.bottom)
                
                Divider()
                
                HStack {
                    
                    Text("See all Upcoming MeetUps")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .padding(.top)
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    MentorHomeScreen()
}
