//
//  SupportAreaMentorMeetUp.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

struct SupportAreaMentorMeetUp: View {
    @State private var selectedCategories: Set<String> = []
    
    var body: some View {
        
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
                
            
                //Display issue for iPhone SE
                //            HStack{
                //                Spacer().frame(height: 60)
                //                Button("Next") {
                //                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                //                }
                //                .buttonStyle(BorderedProminentButtonStyle())
                //                .tint(.blue)
                //                .padding(.trailing,50)
                //    //            .controlSize(.large)
                //            }
                Button(action:{} ){
                   
                        Text("Send Meet Up Request")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedCategories.isEmpty ? Color.gray: Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                
                .disabled(selectedCategories.isEmpty)
                .padding()
            }
            
        }
        
    }


//struct CategoryButton: View {
//    var iconName: String
//    var label: String
//    var color: Color
    
//    @Binding var selectedCategories: Set<String>
    
//    var isSelected: Bool {
  //      selectedCategories.contains(label)
//    }
    
 //   var body: some View {
 //       Button(action: {
 //           if isSelected {
 //               selectedCategories.remove(label)
 //               print("\(label) Removed")
 //           } else {
 //               selectedCategories.insert(label)
 //               print("\(label) Added")
 //           }
 //       })
 //       {
 //           HStack {
 //               Image(systemName: iconName)
 //                   .font(.system(size: 15))
 //                   .foregroundColor(color)
 //                   .padding(.bottom, 5)
 //
 //               Text(label)
 //                   .font(.caption)
 //                  .foregroundColor(.black)
 //           }
 //           .frame(width: 100, height: 40)
 //           //            .background(Color.white)
 //           .background(isSelected ? Color.gray.opacity(0.3) : Color.white)
 //           .cornerRadius(15)
 //           //        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
 //           .overlay(
 //               RoundedRectangle(cornerRadius: 15)
 //                   .stroke(Color.black, lineWidth: 1)
 //           )
 //           .shadow(radius: 5)
 //       }
 //       .buttonStyle(PlainButtonStyle())
 //  }
//}

#Preview {
    SupportAreaMentorMeetUp()
}

