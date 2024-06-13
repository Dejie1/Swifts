//
//  MeetUpRequestListView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 6/6/2024.
//

import SwiftUI

struct MeetUpRequest: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var requestMessage: String
    var requestedTime: String
}

struct MeetUpRequestListView: View {
    let meetUpRequests: [MeetUpRequest] = [
        MeetUpRequest(image: "JohnDoe", name: "Michael", requestMessage: "Can we discuss project management strategies?", requestedTime: "June 15, 2024 at 10:00 AM"),
        MeetUpRequest(image: "JohnDoe", name: "Sarah", requestMessage: "I'd like to go over financial planning.", requestedTime: "June 16, 2024 at 2:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "John", requestMessage: "Can we talk about mental health?", requestedTime: "June 17, 2024 at 4:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "David", requestMessage: "I'd like your advice on digital marketing.", requestedTime: "June 18, 2024 at 11:00 AM"),
        MeetUpRequest(image: "JohnDoe", name: "Anna", requestMessage: "Can we discuss effective communication?", requestedTime: "June 19, 2024 at 3:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "Tom", requestMessage: "I'd like to learn about AI in business.", requestedTime: "June 20, 2024 at 10:00 AM"),
        MeetUpRequest(image: "JohnDoe", name: "Lucy", requestMessage: "Can you teach me the basics of graphic design?", requestedTime: "June 21, 2024 at 1:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "Peter", requestMessage: "Can we go over advanced data analysis techniques?", requestedTime: "June 22, 2024 at 4:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "Emily", requestMessage: "I'd like to learn about blockchain technology.", requestedTime: "June 23, 2024 at 10:00 AM")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(meetUpRequests) { request in
                    HStack(spacing: 16) {
                        Image(request.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(request.name)
                                .font(.headline)
                                .padding(.bottom,6)
                            
                            Text(request.requestMessage)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                                .padding(.bottom,6)
                            Text(request.requestedTime)
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .padding(.bottom,6)
                            HStack {
                                Button(action: {
                                    // Handle accept action
                                }) {
                                    Text("Accept")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(Color.blue)
                                        .cornerRadius(4)
                                }
                                
                                Button(action: {
                                    // Handle decline action
                                }) {
                                    Text("Decline")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
//                                        .background(Color.gray)
                                        .cornerRadius(4)
                                }
                            }
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
        .navigationTitle("MeetUp Requests")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeetUpRequestListView()
}

