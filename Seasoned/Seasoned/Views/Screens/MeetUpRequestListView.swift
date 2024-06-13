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
        MeetUpRequest(image: "EmilyWhite", name: "Emily White", requestMessage: "Can you show me around Sydney?", requestedTime: "July 15, 2024 at 10:00 AM"),
        MeetUpRequest(image: "DavidGreen", name: "David Green", requestMessage: "Hi, can we meet for a while?", requestedTime: "July 16, 2024 at 2:00 PM"),
        MeetUpRequest(image: "JohnDoe", name: "John Doe", requestMessage: "Can we talk about health care in Sydney?", requestedTime: "July 17, 2024 at 4:00 PM"),
        MeetUpRequest(image: "JaneSmith", name: "Jane Smith", requestMessage: "I'd like your advice on the housing matter.", requestedTime: "July 18, 2024 at 11:00 AM"),
        MeetUpRequest(image: "JessicaWilliams", name: "Jessica Williams", requestMessage: "Can we discuss the ways of finding events?", requestedTime: "July 19, 2024 at 3:00 PM"),
        MeetUpRequest(image: "MichaelBrown", name: "Michael Brown", requestMessage: "I'd like to learn about how transport works in Sydney.", requestedTime: "July 20, 2024 at 10:00 AM"),
        MeetUpRequest(image: "SarahJohnson", name: "Sarah Johnson", requestMessage: "Can you teach me the things to look for in finding housing?", requestedTime: "July 21, 2024 at 1:00 PM")
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

