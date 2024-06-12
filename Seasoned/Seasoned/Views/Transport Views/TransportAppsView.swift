//
//  TransportAppsView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 7/6/2024.
//

import SwiftUI

struct TransportAppsView: View {
    var body: some View {
        NavigationStack {
            Text("There are a few different apps that help navigate Sydney's transport system.")
                .padding()
                .font(.title3)
            
            Divider()
            VStack(alignment: .leading) {
                TransportAppRow(appName: "TripView",
                                appIcon: "tripview",
                                appDescription: "Timetable for all Sydney Transport Services",
                                appLink: "http://tripview.com.au",
                                linkText: "Download TripView")
                .padding()
                
                Divider()
                
                TransportAppRow(appName: "NextThere",
                                appIcon: "nextthere",
                                appDescription: "Timetable for all Sydney Transport Services",
                                appLink: "https://nextthere.com",
                                linkText: "Download NextThere")
                .padding()
                
                Divider()
                
                TransportAppRow(appName: "Opal Travel",
                                appIcon: "opallogo",
                                appDescription: "Allows you to top up your opal card on the go ",
                                appLink: "https://transportnsw.info/apps/opal-travel",
                                linkText: "Download Opal Travel")
                .padding()
                
            }
            
            Spacer()
            
            
                .navigationTitle("Transport Apps")
        }
        
    }
}

#Preview {
    TransportAppsView()
}
