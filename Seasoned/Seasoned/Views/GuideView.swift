//
//  GuideView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 2) {
                HStack{
                    Text("Guides")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                }
                .padding()
                Divider()
                    .overlay(Color.black)
                Spacer()
                guideView
                //                Spacer()
            }
    }
}

private var guideView: some View{
    ScrollView {
        VStack(spacing: 20) {
            NavigationLink(destination: PublicTransportInfoView()) {
                GuideCategoryView(categoryName: "Transport", imageName: "Train")
            }
            GuideCategoryView(categoryName: "Housing", imageName: "Housing", isAvailable: false)
            GuideCategoryView(categoryName: "Finance", imageName: "Finance", isAvailable: false)
            GuideCategoryView(categoryName: "Health", imageName: "Health", isAvailable: false)
            GuideCategoryView(categoryName: "Education", imageName: "Education", isAvailable: false)
            GuideCategoryView(categoryName: "Events", imageName: "Event", isAvailable: false)
        }
        .padding(.horizontal)
    }
}

struct GuideCategoryView: View {
    var categoryName: String
    var imageName: String
    var isAvailable: Bool = true
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .cornerRadius(23)
                .grayscale(isAvailable ? 0 : 1)
            
            if isAvailable {
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
            } else {
                VStack {
                    Spacer()
                    Text("Coming soon")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .frame(height: 150)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.gray, lineWidth: 1))
        .disabled(!isAvailable)
    }
}

#Preview {
    GuideView()
}

