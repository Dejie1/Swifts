//
//  CategoryButton.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

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
            HStack {
                Image(systemName: iconName)
                    .font(.system(size: 15))
                    .foregroundColor(color)
                    .padding(.bottom, 5)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .frame(width: 100, height: 40)
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

