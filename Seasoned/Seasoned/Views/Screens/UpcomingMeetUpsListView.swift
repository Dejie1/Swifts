//
//  UpcomingMeetUpsListView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

struct MeetUp: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var description: String
    var scheduledTime: String
}

struct UpcomingMeetUpsListView: View {
    let meetUps: [MeetUp] = [
            MeetUp(image: "MichaelBrown", name: "Michael Brown", description: "Discussing new business strategies and project management.", scheduledTime: "June 26, 2024 at 10:00 AM"),
            MeetUp(image: "JohnDoe", name: "John Doe", description: "Exploring financial planning and investments.", scheduledTime: "June 27, 2024 at 2:00 PM"),
            MeetUp(image: "DavidGreen", name: "David Green", description: "Health and wellness discussion focusing on mental health.", scheduledTime: "June 28, 2024 at 4:00 PM"),
            MeetUp(image: "JaneSmith", name: "Jane Smith", description: "Marketing strategies for the digital age.", scheduledTime: "June 29, 2024 at 11:00 AM"),
            MeetUp(image: "JessicaWilliams", name: "Jessica Williams", description: "Effective communication skills in the workplace.", scheduledTime: "June 30, 2024 at 3:00 PM"),
            MeetUp(image: "SarahJohnson", name: "SarahJohnson", description: "Understanding and implementing AI in business.", scheduledTime: "July 1, 2024 at 10:00 AM"),
            MeetUp(image: "EmilyWhite", name: "Emily White", description: "Basics of graphic design for beginners.", scheduledTime: "July 2, 2024 at 1:00 PM")
        ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(meetUps) { meetUp in
                    HStack(spacing: 16) {
                        Image(meetUp.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(meetUp.name)
                                .font(.headline)
                                .padding(.bottom,6)
                            Text(meetUp.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(3)
                                .padding(.bottom,6)
                            Text(meetUp.scheduledTime)
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .padding(.bottom,6)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .padding()
        }
        .navigationTitle("Upcoming Meet Ups")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpcomingMeetUpsListView()
}
