//
//  OpalCardView.swift
//  Seasoned
//
//  Created by Ryan Walsh on 12/6/2024.
//

import SwiftUI

struct OpalCardView: View {
    var body: some View {
        NavigationStack {
                    VStack {
                        Text("Opal cards are your key to getting around Sydney. They allow you to access each service in the Sydney transport system, simply by tapping the card on the reader. ")
                            .font(.headline)
                            .padding()
                            .frame(width: 370, height: 120)
                            .background(Color.white)
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 10)

                        Divider()

                        Text("The different types of opal cards are: ")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.bottom, .top])

                        VStack(alignment: .center)  {
                            Text("Child - for children under the age of 16")
                                .frame(width: 320, height: 50)
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))


                            Text("Adult - for people over the age of 16")
                                .frame(width: 320, height: 50)
                                .background(Color.gray)
        //                        .fontWeight(.semibold)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))

                            Text("Concession - for Tertiary Education")
                                .frame(width: 320, height: 50)
                                .background(Color.lightgray)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))

                            Text("School - for school students")
                                .frame(width: 320, height: 50)
                                .background(Color.lightblue)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))

                            Text("Seniors - for people aged over 60")
                                .frame(width: 320, height: 50)
                                .background(Color.gold)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                .padding(.bottom)
                        }

                        Divider()

                        Link(destination: URL(string: "https://transportnsw.info/tickets-opal/opal#/login")!, label: {
                            Text("Get more information about Opal")
                                .frame(width: 370, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue, lineWidth: 5))
                                .background(Color.white)
                                .foregroundStyle(.blue)
                                .font(.title2)
                                .fontWeight(.bold)
        //                        .underline()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .padding()



                        })

                        Spacer()

                    }
                    .navigationTitle("Opal Cards")
                }
    }
}

#Preview {
    OpalCardView()
}
