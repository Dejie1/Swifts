//
//  SydenyTrainsView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 7/6/2024.
//

import SwiftUI

struct SydneyTrainsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Sydney Trains Network")
                
                Image("sydneytrainsnetwork")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                }
  
                .navigationTitle("Sydney Trains")
        }
    }
}

#Preview {
    SydneyTrainsView()
}
