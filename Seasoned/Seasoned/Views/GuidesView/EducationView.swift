//
//  EducationView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct EducationView: View {
    var body: some View {
        VStack {
            Text("Education Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Education")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EducationView()
}
