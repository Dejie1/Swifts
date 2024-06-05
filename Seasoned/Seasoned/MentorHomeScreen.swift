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
        
        HStack {
            Text("Upcoming MeetUps")
                .font(.title2)
            
            Spacer()
            
        }
        .padding(.horizontal)
            
            HStack {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60)
                
                VStack(alignment: .leading) {
                    Text("Student Name")
                        .font(.title3)
                    Text("Scheduled for 10:00am Tuesday 26 June")
                        .font(.caption)
                
                
            }
            Spacer()
        }
            .padding(.horizontal)
    }
}

#Preview {
    MentorHomeScreen()
}
