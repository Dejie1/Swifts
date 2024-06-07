//
//  PublicTransportInfoView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 7/6/2024.
//

import SwiftUI

struct PublicTransportInfoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
//                    Text("Public Transport Information")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding([.horizontal, .top])
                    
                    Divider()
                    
                    NavigationLink(
                        destination: SydneyTrainsView()) {
                            PublicTransportRow(image: "sydneytrains",
                                               title: "Sydney Trains",
                                               description: "The train network of Sydney CBD and Greater Sydney")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    NavigationLink(
                        destination: SydneyBusesView()) {
                            PublicTransportRow(image: "sydneybuses",
                                               title: "Sydney Buses",
                                               description: "The bus network of Sydney CBD and Greater Sydney")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink(
                        destination: SydneyMetroView()) {
                            PublicTransportRow(image: "sydneymetro2",
                                               title: "Sydney Metro",
                                               description: "The metro network connecting Chatswood and Tallawong")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink(
                        destination: SydneyLightRailView()) {
                            PublicTransportRow(image: "sydneylightrail",
                                               title: "Sydney Light Rail",
                                               description: "The light rail network of Sydney CBD and surrounding suburbs")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink(
                        destination: SydneyFerriesView()) {
                            PublicTransportRow(image: "sydneyferries",
                                               title: "Sydney Ferries",
                                               description: "The ferry network of Sydney Harbour and Parramatta River")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink(
                        destination: OpalCardView()) {
                            PublicTransportRow(image: "opallogo",
                                               title: "Opal Cards",
                                               description: "Opal is your key to get around, here's what you need to know")}
                        .foregroundStyle(.black)
                        .padding()
                    
                    Divider()
                    
                    NavigationLink(
                        destination: TransportAppsView()) {
                            PublicTransportRow(image: "applogo2",
                                               title: "Transport Apps",
                                               description: "There are many apps that can help find when your services leave")}
                        .foregroundStyle(.black)
                        .padding()
                }
            }
            .navigationTitle("Public Transport")
        }
    }
}

#Preview {
    PublicTransportInfoView()
}
