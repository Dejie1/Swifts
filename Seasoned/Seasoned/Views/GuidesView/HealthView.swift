//
//  HealthView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct HealthView: View {
    var body: some View {
            VStack {
                Text("Health Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Health")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    HealthView()
}
