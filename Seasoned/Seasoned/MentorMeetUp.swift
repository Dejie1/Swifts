//
//  MentorDetailView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 4/6/2024.
//

import SwiftUI

struct MentorMeetUp: View {
    @State private var description: String = ""
    @State private var meetUpDate = Date()
    
    var body: some View {
        VStack {
            Text("Schedule a Meet Up")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                
                TextField("Example: Hey, can we meet up to discuss finance and health?", text: $description, axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Text("Pick a Date and Time")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                DatePicker("Meet Up Date", selection: $meetUpDate, in: Date()...)
                    .padding(.horizontal)
                
                
                
                
            }
        }
    }
}

#Preview {
    MentorMeetUp()
}
