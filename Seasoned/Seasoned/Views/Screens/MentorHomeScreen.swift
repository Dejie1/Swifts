//
//  MentorHomeScreen.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MentorHomeScreen: View {
    
    @EnvironmentObject var vm: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Home")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    Spacer()
                    
                    WebImage(url: URL(string: vm.user?.profileImageUrl ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(50)
                        .overlay(RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color(.label), lineWidth: 1)
                        )
                        .shadow(radius: 5)
                }
                .padding()
                
                Divider()
                    .overlay(Color.black)
                ScrollView{
                    VStack(spacing: 10) {
                        UpcomingMeetUpsSection()
                        Spacer()
                        MeetUpRequestsSection()
                        Spacer()
                    }
                    .padding()
                    .background(Color.clear)
                }
            }
        }
    }
}

struct UpcomingMeetUpsSection: View {
    var body: some View {
        VStack {
            HStack {
                Text("Upcoming MeetUps")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Divider()
                .overlay(Color.black)
            
            VStack {
                StudentRow2(imageName: "MichaelBrown",
                           studentName: "  Michael",
                           meetUpTime: "  10am Tuesday 26 June")
                
                Divider()
                
                StudentRow2(imageName: "JohnDoe",
                           studentName: "  John",
                           meetUpTime: "  2pm Wednesday 27 June")
            }
//            .padding(.bottom, 5)
            
            Divider()
            
            HStack {
                Spacer()
                NavigationLink("See all", destination: UpcomingMeetUpsListView())
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                
            }
            .padding(.top, 10)
        }
        .padding(.horizontal)
        .frame(width: 350, height: 320)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MeetUpRequestsSection: View {
    var body: some View {
        VStack {
            HStack {
                Text("MeetUp Requests")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
//            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
            
            Divider()
                .overlay(Color.black)
            
            VStack {
                StudentRequestRow2(imageName: "EmilyWhite",
                                  studentName: "  Emily",
                                  requestMessage: "  Hi, I would like to MeetUp ")
                
                Divider()
                
                StudentRequestRow2(imageName: "DavidGreen",
                                  studentName: "  David",
                                  requestMessage: "  Hi, I would like to MeetUp")
            }
//            .padding(.bottom, 10)
            
            Divider()
            
            HStack {
                Spacer()
                NavigationLink("See all", destination: MeetUpRequestListView())
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
            }
            .padding(.top, 10)
        }
        .padding(.horizontal)
        .frame(width: 350, height: 320)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct StudentRow2: View {
    var imageName: String
    var studentName: String
    var meetUpTime: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(studentName)
                    .font(.headline)
                Text(meetUpTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

struct StudentRequestRow2: View {
    var imageName: String
    var studentName: String
    var requestMessage: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 1))
//                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(studentName)
                    .font(.headline)
                Text(requestMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MentorHomeScreen()
        .environmentObject(UserViewModel())
}

