//
//  TransportAppRow.swift
//  Seasoned
//
//  Created by Ryan Walsh on 12/6/2024.
//

import SwiftUI

struct TransportAppRow: View {
       var appName:        String
       var appIcon:        String
       var appDescription: String
       var appLink:        String
       var linkText:       String

       var body: some View {

           HStack{
               Image(appIcon)
                   .resizable()
                   .scaledToFit()
                   .frame(width: 70)
                   .clipShape(RoundedRectangle(cornerRadius: 10))

               VStack(alignment: .leading) {
                   Text(appName)
                       .font(.title3)
                       .fontWeight(.semibold)

                   Text(appDescription)
                       .font(.caption)
                       .fontWeight(.regular)

                   Link(destination: URL(string: "\(appLink)")!,
                        label: { Text(linkText)
                                   .underline()
                                   .bold()
                   })
               }
           }
       }
   }

   #Preview {
       TransportAppRow(appName: "TripView", appIcon: "tripview", appDescription: "Timetable for all Sydney Transport Services", appLink: "http://tripview.com.au", linkText: "Download TripView")
   }
