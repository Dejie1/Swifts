//
//  StudentRow.swift
//  Seasoned
//
//  Created by Ryan Walsh on 5/6/2024.
//

import SwiftUI

struct StudentRow: View {
    
    var image : String
    var studentName : String
    var meetUpTime : String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 60)
            
            VStack(alignment: .leading) {
                Text(studentName)
                    .font(.title3)
                Text("Scheduled for (\meetUpTime)")
                    .font(.caption)
            
            
        }
        Spacer()
        }
    }
}

#Preview {
    StudentRow()
}
