//
//  MentorHomeScreen.swift
//  Seasoned
//
//  Created by Ryan Walsh on 12/6/2024.
//

import SwiftUI

struct MentorHomeScreen: View {
    var body: some View {
        NavigationStack {
               ZStack {
                   LinearGradient(colors: [.green, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                   .ignoresSafeArea()

                   VStack {
                       Text("Welcome, Mentor")
                           .font(.title)
                           .fontWeight(.bold)
                           .padding()
                           .foregroundStyle(.white)
                       VStack {
                           HStack {
                               Text("Upcoming MeetUps")
                                   .font(.title2)
                                   .fontWeight(.bold)

                               Spacer()

                           }
                           .padding(.horizontal)

                           Divider()

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
                               .padding(.bottom, 10)

                               Divider()

                               HStack {
                                   NavigationLink(("See all Upcoming MeetUps"), destination: UpcomingMeetUpsListView())
                                       .foregroundStyle(.black)
                                       .fontWeight(.semibold)
       //                            Text("See all Upcoming MeetUps")
       //                                .fontWeight(.semibold)

                                   Spacer()

       //                            Image(systemName: "chevron.right")
                               }
                               .padding(.top, 10)
                           }
                           .padding(.horizontal)
                       }
                       .frame(width: 350, height: 290)
                       .background(Color(UIColor(.white)))
                       .opacity(0.8)
                       .cornerRadius(10)
                       .shadow(radius: 15)

                       Spacer()

                       VStack {
                           HStack {
                               Text("MeetUp Requests")
                                   .font(.title2)
                                   .fontWeight(.bold)

                               Spacer()

                           }
                           .padding(.horizontal)

                           Divider()

                           VStack {
                               VStack {
                                   StudentRequestRow(image: "placeholder",
                                                     studentName: "StudentName",
                                                     requestMessage: "Hi, I would like to MeetUp and discuss some topics")

                                   StudentRequestRow(image: "placeholder",
                                                     studentName: "StudentName",
                                                     requestMessage: "Hi, I would like to MeetUp and discuss some topics")

                                   StudentRequestRow(image: "placeholder",
                                                     studentName: "StudentName",
                                                     requestMessage: "Hi, I would like to MeetUp and discuss some topics")
                               }
                               .padding(.bottom, 10)

                               Divider()

                               HStack {

                                   NavigationLink(("See all MeetUp Requests"), destination: MeetUpRequestListView())
                                       .foregroundStyle(.black)
                                       .fontWeight(.semibold)

       //                            Text("See all Upcoming MeetUps")
       //                                .fontWeight(.semibold)

                                   Spacer()

       //                            Image(systemName: "chevron.right")
                               }
                               .padding(.top, 10)
                           }
                           .padding(.horizontal)
                       }
                       .frame(width: 350, height: 320)
                       .background(Color(UIColor(.white)))
                       .opacity(0.8)
                       .cornerRadius(10)
                       .shadow(radius: 15)

                       Spacer()

                       }
                   }
               }
           }
       }

#Preview {
    MentorHomeScreen()
}
