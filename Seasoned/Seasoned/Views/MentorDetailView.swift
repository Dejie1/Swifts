//
//  MentorDetailView.swift
//  Seasoned
//
//  Created by De Jie Ang on 12/6/2024.
//

import SwiftUI

struct MentorDetailView: View {
    var mentor: User
    @State private var showAlert = false
    // Mapping categories to colors and symbols
    let categoryStyles: [String: (color: Color, symbol: String)] = [
        "Finance": (color: Color.green, symbol: "dollarsign.circle"),
        "Housing": (color: Color.blue, symbol: "house"),
        "Transport": (color: Color.red, symbol: "tram.fill"),
        "Education": (color: Color.orange, symbol: "graduationcap.fill"),
        "Event": (color: Color.purple, symbol: "person.3.fill"),
        "Health": (color: Color.teal, symbol: "cross.circle.fill")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack{
                    Spacer()
                    // Mentor Image
                    if let profileImageUrl = URL(string: mentor.profileImageUrl) {
                        AsyncImage(url: profileImageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 200, height: 200)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    .shadow(radius: 3)
                            case .failure:
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    Spacer()
                }
                .padding(.top,30)
                .padding(.bottom,10)

                HStack{
                    // Mentor Name
                    Text(mentor.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    // Request to Connect Button
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Connect")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Capsule().fill(Color.blue.opacity(0.2)))
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Connected"),
                            message: Text("Start Messaging!"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
                .padding(.bottom,10)
                Divider()

                Text("")
                // About Section
                Text("About")
                    .font(.headline)
                    .fontWeight(.bold)

                if let about = mentor.about {
                    Text(about)
                        .font(.body)
                } else {
                    Text("No about information available.")
                        .font(.body)
                }

                Text("")
                Divider()

                // Selected Categories Section
                Text("Helps In")
                    .font(.headline)
                    .fontWeight(.bold)

                if let categories = mentor.selectedCategories, !categories.isEmpty {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            if let style = categoryStyles[category] {
                                HStack {
                                    Image(systemName: style.symbol)
                                    Text(category)
                                }
                                .font(.subheadline)
                                .padding(5)
                                .background(style.color.opacity(0.2))
                                .cornerRadius(5)
                                .foregroundColor(style.color)
                            } else {
                                HStack {
                                    Image(systemName: "questionmark.circle")
                                    Text(category)
                                }
                                .font(.subheadline)
                                .padding(5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .foregroundColor(Color.gray)
                            }
                        }
                    }
                } else {
                    Text("No selected categories.")
                        .font(.subheadline)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Mentor Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MentorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MentorDetailView(mentor: User(
            id: "1",
            uid: "1",
            email: "example@example.com",
            profileImageUrl: "https://example.com/profile.jpg",
            userType: "Mentor",
            selectedCategories: ["Finance", "Housing", "Transport", "Education", "Event", "Health"],
            hasSelectedCategories: true,
            name: "Baki Kocaballi",
            about: "In the Apple Foundation Program, we're empowering students to solve real-world problems through challenge-based learning."
        ))
    }
}
