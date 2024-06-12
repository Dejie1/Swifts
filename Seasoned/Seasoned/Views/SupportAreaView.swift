//
//  SupportArea.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct SupportAreaView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var selectedCategories: Set<String> = []
    @State private var navigateToHome = false
    @State private var navigateToMentors = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer().frame(height: 50)
                Group {
                    Text("Hi, \(userViewModel.displayName)!")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(.bottom, 15)
                    Text(userViewModel.user?.userType == "Mentor" ? "Which category do you want to help in?" : "Where do you need help in?")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .navigationBarBackButtonHidden(true)
                Spacer().frame(height: 45)
                
                VStack(spacing: 25) {
                    HStack(spacing: 40) {
                        CategoryButton2(iconName: "dollarsign.circle", label: "Finance", color: Color(red: 0, green: 0.588, blue: 0.533), selectedCategories: $selectedCategories)
                        CategoryButton2(iconName: "house.fill", label: "Housing", color: Color(red:0.29804, green:0.68627, blue:0.31373), selectedCategories: $selectedCategories)
                    }
                    
                    HStack(spacing: 40) {
                        CategoryButton2(iconName: "cross.circle.fill", label: "Health", color: Color(red:0.12941, green:0.58824, blue:0.95294), selectedCategories: $selectedCategories)
                        CategoryButton2(iconName: "graduationcap.fill", label: "Education", color: Color(red:1.00000, green:0.59608, blue:0.00000), selectedCategories: $selectedCategories)
                    }
                    
                    HStack(spacing: 40) {
                        CategoryButton2(iconName: "tram.fill", label: "Transport", color: Color(red:0.95686, green:0.26275, blue:0.21176), selectedCategories: $selectedCategories)
                        CategoryButton2(iconName: "person.3.fill", label: "Events", color: Color(red:0.61176, green:0.15294, blue:0.69020), selectedCategories: $selectedCategories)
                    }
                }
                
                Button(action: {
                    if userViewModel.user?.userType == "Mentor" {
                        updateMentorCategories()
                        navigateToHome = true
                    } else {
                        navigateToMentors = true
                    }
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedCategories.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(selectedCategories.isEmpty)
                .padding()
            }
            .navigationDestination(isPresented: $navigateToHome) {
                ContentView()
            }
//            .navigationDestination(isPresented: $navigateToMentors) {
//                MentorList(selectedCategories: Array(selectedCategories))
//                    .environmentObject(userViewModel)
//                    .navigationBarBackButtonHidden(false)
                
            .fullScreenCover(isPresented: $navigateToMentors) {
                NavigationStack {
                    MentorList(selectedCategories: Array(selectedCategories))
                        .environmentObject(userViewModel)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Close") {
                                    navigateToMentors = false
                                }
                            }
                        }
                }
            }
        }
        .onAppear {
            userViewModel.fetchCurrentUser()
        }
//        .navigationBarBackButtonHidden(true)
    }
    
    private func updateMentorCategories() {
        UserManager.shared.updateSelectedCategories(Array(selectedCategories)) { result in
            switch result {
            case .success():
                print("Categories updated successfully")
            case .failure(let error):
                print("Failed to update categories:", error)
            }
        }
    }
}

struct CategoryButton2: View {
    var iconName: String
    var label: String
    var color: Color
    
    @Binding var selectedCategories: Set<String>

    var isSelected: Bool {
        selectedCategories.contains(label)
    }
    
    var body: some View {
        Button(action: {
            if isSelected {
                selectedCategories.remove(label)
                print("\(label) Removed")
            } else {
                selectedCategories.insert(label)
                print("\(label) Added")
            }
        }) {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 40))
                    .foregroundColor(color)
                    .padding(.bottom, 5)
                
                Text(label)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(width: 140, height: 140)
            .background(isSelected ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 1)
            )
            .shadow(radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    SupportAreaView()
        .environmentObject(UserViewModel())
}
