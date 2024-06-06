//
//  Inboxrowview.swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI

struct Inboxrowview: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height:64)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 4){
                
                Text("Harry")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("Hi I am Harry, Can you please help me with a few things? I am new here.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: UIScreen.main.bounds.width - 200, alignment: .leading )
                    .truncationMode(.tail)
                   
                Text("Wed, 28 June - 2:00 pm - 3:00 pm")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            
            HStack{
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.black)
        }
       
        .frame(height:72)
    }
}

#Preview {
    Inboxrowview()
}
