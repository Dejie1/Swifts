//
//  MentorDetailView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 4/6/2024.
//

import SwiftUI

struct MentorMeetUp: View {
    @State private var description: String = ""
    @State private var meetUpDate = Date()
    @State private var selectedCategories: Set<String> = []
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                
                TextField("Example: Hey, can we meet up to discuss finance and health?", text: $description, axis: .vertical)
                    .lineLimit(15, reservesSpace: true)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
          
                
                VStack(alignment: .leading) {
                    Text("Pick a Date and Time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal)

                    DatePicker("Meet Up Date", selection: $meetUpDate, in: Date()...)
                        .padding(.horizontal)
                    
                }
                .padding(.top)
                .padding(.bottom)
              
                VStack{
                    VStack(spacing: 15) {
                        HStack(spacing: 20) {
                            CategoryButton(iconName: "dollarsign.circle",
                                           label: "Finance",
                                           color: Color(red: 0, green: 0.588, blue: 0.533),
                                           selectedCategories: $selectedCategories)
                            
                            CategoryButton(iconName: "house.fill",
                                           label: "Housing",
                                           color: Color(red:0.29804, green:0.68627, blue:0.31373),
                                           selectedCategories: $selectedCategories)
                            
                            CategoryButton(iconName: "cross.circle.fill",
                                           label: "Health",
                                           color: Color(red:0.12941, green:0.58824, blue:0.95294),
                                           selectedCategories: $selectedCategories)
                        }
                        
                        HStack(spacing: 20) {
                            CategoryButton(iconName: "graduationcap.fill",
                                           label: "Education",
                                           color: Color(red:1.00000, green:0.59608, blue:0.00000),
                                           selectedCategories: $selectedCategories)
                            
                            CategoryButton(iconName: "tram.fill",
                                           label: "Transport",
                                           color: Color(red:0.95686, green:0.26275, blue:0.21176),
                                           selectedCategories: $selectedCategories)
                            
                            CategoryButton(iconName: "person.3.fill",
                                           label: "Events",
                                           color: Color(red:0.61176, green:0.15294, blue:0.69020),
                                           selectedCategories: $selectedCategories)
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                
                    Button(action:{
                        showAlert = true
                    }) {
                            Text("Send MeetUp Request")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedCategories.isEmpty ? Color.gray: Color.blue)
                                .cornerRadius(30)
                                .padding(.horizontal)
                        }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Sent"),
                            message: Text("MeetUp request has been sent."),
                            dismissButton: .default(Text("OK"), action: {
//                                isPresented = false
                            })
                        )
                    }
                    .disabled(selectedCategories.isEmpty)
                    .padding()
                }
//                Spacer().frame(height: 100) // Add this Spacer to move the VStack up
            }
            
        }
//        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .navigationTitle("Schedule a Meet Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MentorMeetUp()
}

