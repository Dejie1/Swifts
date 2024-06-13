//
//  EventView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct EventView: View {
    var body: some View {
            VStack {
                Text("Events Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Events")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    EventView()
}
