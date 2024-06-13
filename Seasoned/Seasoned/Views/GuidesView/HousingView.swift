//
//  HousingView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct HousingView: View {
    var body: some View {
        VStack {
            Text("Housing Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Housing")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HousingView()
}

