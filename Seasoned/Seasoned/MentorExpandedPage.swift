//
//  MentorExpandedPage.swift
//  Seasoned
//
//  Created by Cicely Lomas on 4/6/2024.
//

import SwiftUI

struct MentorExpandedPage: View {
    var body: some View {
            ScrollView{
                VStack (alignment: .leading){
                   
                        MentorImage()
                    
                        HStack{
                            Text("John Doe")
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            RequestToConnectButton()
                            
                        }
                        .padding()
                    
                        Text("About")
                            .font(.title3)
                            .padding(.leading)
                    
                            
                    Group{
                        Text("Age: 24")
                        
                        HStack {
                            Text("Bachelor of Computer Science")
                            Spacer()
                            Text("USYD")
                        }
                        
                        Text("Ethnicity")
                        
                        Text("Small Bio")
                    }
                    .foregroundStyle(.secondary)
                    .padding([.leading, .trailing])
                    
                    
                    Text("Helps In")
                        .font(.title3)
                        .padding()
                    
                    HStack{
                        Text("Housing")
                        
                    }
                    
                }

            }
        }
    }

#Preview {
    MentorExpandedPage()
}
