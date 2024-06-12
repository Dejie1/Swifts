//
//  MentorList.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct MentorList: View {
    @ObservedObject var viewModel = UserViewModel()
    var selectedCategories: [String]
    
    var filteredMentors: [User] {
        if selectedCategories.isEmpty {
            return viewModel.mentors
        } else {
            return viewModel.mentors.filter { mentor in
                guard let categories = mentor.selectedCategories else { return false }
                return Set(selectedCategories).isSubset(of: categories)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
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
                if selectedCategories == ["Transport"] {
                    NavigationLink(destination: PublicTransportInfoView()) {
                        Text("Get more Information")
                            .font(.headline)
                            .underline()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    }
                }
                        
                
                Divider()
                
                if viewModel.errorMessage.isEmpty && filteredMentors.isEmpty {
                    Spacer()
                    Text("No mentor available.")
                        .font(.title)
                        .frame(maxWidth: 300, maxHeight: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 30) { // Add spacing here
                            ForEach(filteredMentors, id: \.uid) { mentor in
                                MentorRow(mentor: mentor)
                                    .padding(.leading, 15)
                                    .padding([.top, .bottom], 15)
                                    .background(Color(UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1.0)))
                                    .cornerRadius(10)
                            }
                            .frame(width: 365)
                        }
                        .padding([.leading, .trailing], 30)
                    }
                    .padding(.top, 20)
                }
            }
            .onAppear {
                viewModel.fetchMentors(forCategories: selectedCategories)
            }
        }
    }
}

#Preview {
    MentorList(selectedCategories: ["Finance"])
}
