//
//  GuideView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Guides")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding()
                
                Divider()
                    .overlay(Color.black)
                Spacer()
                
                ScrollView {
                    VStack(spacing: 20) {
                        NavigationLink(destination: PublicTransportInfoView()) {
                                                    GuideCategoryView(categoryName: "Transport", imageName: "Train")
                                                }
                        NavigationLink(destination: HousingView()) {
                                                    GuideCategoryView(categoryName: "Housing", imageName: "Housing")
                                                }
                        NavigationLink(destination: FinanceView()) {
                                                    GuideCategoryView(categoryName: "Finance", imageName: "Finance")
                                                }
                        NavigationLink(destination: HealthView()) {
                                                    GuideCategoryView(categoryName: "Health", imageName: "Health")
                                                }
                        NavigationLink(destination: EducationView()) {
                                                    GuideCategoryView(categoryName: "Education", imageName: "Education")
                                                }
                        NavigationLink(destination: EventView()) {
                                                    GuideCategoryView(categoryName: "Events", imageName: "Event")
                                                }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

struct GuideCategoryView: View {
    var categoryName: String
    var imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .cornerRadius(23)
            
            HStack {
                Spacer()
                Text(categoryName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.black)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .padding(.trailing)
            }
            .frame(height: 150)
            .background(Color.white.opacity(0.4))
            .cornerRadius(10)
        }
//        .shadow(radius: 5)
        .overlay(RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.gray,lineWidth: 1))
    }
}

#Preview {
    GuideView()
}

