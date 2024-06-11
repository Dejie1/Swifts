//
//  MentorList.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct MentorList: View {
    var selectedCategories: Set <String>
    
    var filteredMentors: [Mentor] {
        if selectedCategories.isEmpty {
            return mentors
        } else {
            return mentors.filter { mentor in
//                !Set(mentor.categories).isDisjoint(with: selectedCategories)
                Set(selectedCategories).isSubset(of: mentor.categories)
            }
        }
    }
    
    var displayMessage: String {
        if filteredMentors.isEmpty {
            return "No mentor available"
        } else {
            return ""
        }
    }

    var body: some View {
        
        Group{
            Text("Here’s some seasoned students that may help.")
                .font(.title)
                .fontWeight(.black)
                .padding(.top,30)
                .padding(.bottom,15)
            Text("Find the one that matches your ")
                .font(.title2)
                .fontWeight(.semibold)
            + Text("Vibe")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.purple)
            + Text("!")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding(.leading,20)
        .frame(maxWidth:.infinity, alignment: .leading)
        Divider()
        
        if !displayMessage.isEmpty{
            Spacer()
            Text("No mentor available.")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 300,maxHeight: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
            Spacer()
        }
        else{
            ScrollView {
                VStack(spacing: 30) { // Add spacing here
                    ForEach(filteredMentors, id: \.self) { mentor in
                        MentorRow(mentor: mentor)
                            .padding(.leading,15)
                            .padding([.top,.bottom],15)
                            .background(Color(UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1.0)))
                            .cornerRadius(10)
                        //                        .shadow(radius: 5)
                    }
                    .frame(width: 365)
                }
//                .padding([.top,.bottom])
                .padding([.leading,.trailing],30)
                //            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            .padding(.top,20)
        }
    }
}



#Preview {
    MentorList(selectedCategories: [])
}
