//
//  SupportArea.swift
//  Seasoned
//
//  Created by De Jie Ang on 3/6/2024.
//

import SwiftUI

struct SupportArea: View {
    @State private var selectedCategories: Set<String> = []
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height: 50)
                Group{
                    Text("Hi, User!")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(.bottom,15)
                    Text("Where do you need help in? ")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.leading,20)
                .frame(maxWidth:.infinity, alignment: .leading)
                Spacer().frame(height: 45)
                
                VStack(spacing: 25) {
                    HStack(spacing: 40) {
                        CategoryButton(iconName: "dollarsign.circle", label: "Finance", color: Color(red: 0, green: 0.588, blue: 0.533), selectedCategories: $selectedCategories)
                        CategoryButton(iconName: "house.fill", label: "Housing", color: Color(red:0.29804, green:0.68627, blue:0.31373), selectedCategories: $selectedCategories)
                    }
                    
                    HStack(spacing: 40) {
                        CategoryButton(iconName: "cross.circle.fill", label: "Health",color: Color(red:0.12941, green:0.58824, blue:0.95294), selectedCategories: $selectedCategories)
                        CategoryButton(iconName: "graduationcap.fill", label: "Education", color: Color(red:1.00000, green:0.59608, blue:0.00000), selectedCategories: $selectedCategories)
                    }
                    
                    HStack(spacing: 40) {
                        CategoryButton(iconName: "tram.fill", label: "Transport", color: Color(red:0.95686, green:0.26275, blue:0.21176), selectedCategories: $selectedCategories)
                        CategoryButton(iconName: "person.3.fill", label: "Events", color: Color(red:0.61176, green:0.15294, blue:0.69020), selectedCategories: $selectedCategories)
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
                    NavigationLink(destination: MentorList(selectedCategories: selectedCategories)) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedCategories.isEmpty ? Color.gray: Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .disabled(selectedCategories.isEmpty)
                .padding()
            }
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CategoryButton: View {
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
        })
        {
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
//            .background(Color.white)
            .background(isSelected ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(15)
            //        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
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
    SupportArea()
}
