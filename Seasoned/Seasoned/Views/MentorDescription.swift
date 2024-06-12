//
//  MentorDescription.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct MentorDescription: View {
    
    //var name: User
    
    var body: some View {
        
        //main content screen

            ZStack{
                VStack{
                    
                    MentorImage()
                        .padding(.top, -70)
                    
                    VStack (alignment: .leading){
                        //Name and Popup button
                        HStack (alignment: .top){
                            Text("JohnDoe")
                                .frame(alignment: .center)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.top, 12)
                            
                            
                            Spacer()
                        }
                        .padding(.leading, 15)
                        
                        //description content
                        Text("About")
                            .font(.title3)
                            .padding(.leading)
                            .padding(.top, 1)
                        
                        // specific mentor user data
                        Group{
                            Text("Age: 24")
                            
                            HStack {
                                Text("Bachelor of Computer Science")
                                Spacer()
                                Text("USYD")
                            }
                            
                            Text("small description")
                        }
                        .foregroundStyle(.secondary)
                        .padding(.leading)
                        .padding(.trailing, 20)
                        .padding(.top, 4)
                        .padding(.bottom, -2)
                        
                        
                        // filtered categories
                        Text("Helps In")
                            .font(.title3)
                            .padding()
                            .padding(.top, 5)
                        
                        HStack{ // to be filter icons
                            Text("Housing")
                                .padding(.leading)
                            
                            Text("Finance")
                            
                            Text("Health")
                            
                            Text("Transport")
                            
                            Text("Events")
                            
                        }
                        
                    }
                }
                .padding()
                
                VStack{
                    RequestToConnectButton()
                }
            }
        }
}

#Preview {
    MentorDescription()
}
