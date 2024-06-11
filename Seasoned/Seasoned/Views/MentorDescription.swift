//
//  MentorDescription.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct MentorDescription: View {
    
    
    
    var body: some View {
        
        //main content screen
        ScrollView{
            ZStack{
                VStack (alignment: .leading){
                    
                    MentorImage()
                        .frame(width: 400, height: 400, alignment: .center)
                    
                    //Name and Popup button
                    HStack (alignment: .top){
                        Text("JohnDoe")
                            .frame(alignment: .center)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    
                    
                    //description content
                    Text("About")
                        .font(.title3)
                        .padding(.leading)
                    
                    // specific mentor user data
                    Group{
                        Text("Age: 24")
                        
                        HStack {
                            Text("Bachelor of Computer Science")
                            Spacer()
                            Text("USYD")
                        }
                        
                        Text("Small Description")
                    }
                    .foregroundStyle(.secondary)
                    .padding([.leading, .trailing])
                    
                    
                    // filtered categories
                    Text("Helps In")
                        .font(.title3)
                        .padding()
                    
                    HStack{
                        Text("Housing")
                            .padding(.leading)
                        
                        Text("Finance")
                        
                        Text("Health")
                        
                        Text("Transport")
                        
                        Text("Events")
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RequestToConnectButton()
                }
                
            }
        }
    }
}

#Preview {
    MentorDescription()
}
