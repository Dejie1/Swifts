//
//  StudentRequestRow.swift
//  Seasoned
//
//  Created by Ryan Walsh on 12/6/2024.
//

import SwiftUI

struct StudentRequestRow: View {
    var image: String
        var studentName: String
        var requestMessage: String

        var body: some View {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 45)

                VStack(alignment: .leading) {
                    Text(studentName)
                        .font(.title3)
                    Text(requestMessage)
                        .font(.caption)


            }
            Spacer()
            }
        }
    }

    #Preview {
        StudentRequestRow(image: "placeholder", studentName: "Student Name", requestMessage: "Hi, I would like to MeetUp to discuss some topics")
    }
