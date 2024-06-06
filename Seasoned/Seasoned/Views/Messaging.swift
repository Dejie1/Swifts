//
//  Messaging.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Inbox")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading,40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Spacer()
                
                
                Button(action: {
                    // Your action here
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }
                .frame(width:50, height:50)
                .background(Color(red:0.92549, green:0.90588, blue:0.90588))
                .background(in: RoundedRectangle(cornerRadius: 10))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(Color.black, lineWidth: 1)
//                )
//                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Spacer().frame(width: 30)

            }
            .padding(.top,30)
        }
        Spacer()
    }
}

#Preview {
    MessageView()
}
