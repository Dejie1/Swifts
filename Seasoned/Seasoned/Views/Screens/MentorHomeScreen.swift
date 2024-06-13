//
//  MentorHomeScreen.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

struct MentorHomeScreen: View {
    
    @EnvironmentObject var vm: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading, spacing: 0) {
                Text("Welcome, \(vm.displayName)")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.leading)
                    .padding(.bottom, 18)
                    .padding(.top, 20)
                
                Divider()
                    .overlay(Color.black)
                
                VStack(spacing: 20) {
                    UpcomingMeetUpsSection()
                    MeetUpRequestsSection()
                    Spacer()
                }
                .padding()
                .background(Color.clear)
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
            .padding(.horizontal)
            
            Divider()
                .overlay(Color.black)
            
            
            VStack {
                
                StudentRow(image: "placeholder",
                           studentName: "Student Name",
                           meetUpTime: "10am Tuesday 26 June")
                
                Divider()
                
                StudentRow(image: "placeholder",
                           studentName: "Student Name",
                           meetUpTime: "10am Tuesday 26 June")
            }
            .padding(.bottom, 10)
            
            Divider()
            
            HStack {
                NavigationLink("See all Upcoming MeetUps", destination: UpcomingMeetUpsListView())
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.top, 10)
        }
        .padding(.horizontal)
        .frame(width: 350, height: 240)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 15)
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
            .padding(.horizontal)
            
            Divider()
                .overlay(Color.black)
            
            VStack {
                StudentRequestRow(image: "placeholder",
                                  studentName: "StudentName",
                                  requestMessage: "Hi, I would like to MeetUp ")
                
                Divider()
                
                StudentRequestRow(image: "placeholder",
                                  studentName: "StudentName",
                                  requestMessage: "Hi, I would like to MeetUp")
                
            }
            .padding(.bottom, 10)
            
            Divider()
            
            HStack {
                NavigationLink("See all MeetUp Requests", destination: MeetUpRequestListView())
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.top, 10)
        }
        .padding(.horizontal)
        .frame(width: 350, height: 240)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}

#Preview {
    MentorHomeScreen()
        .environmentObject(UserViewModel())
}

