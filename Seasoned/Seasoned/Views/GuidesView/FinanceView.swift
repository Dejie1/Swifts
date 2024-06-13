//
//  FinanceView.swift
//  Seasoned
//
//  Created by De Jie Ang on 13/6/2024.
//

import SwiftUI

struct FinanceView: View {
    var body: some View {
        VStack {
            Text("Finance Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Finance")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    FinanceView()
}

