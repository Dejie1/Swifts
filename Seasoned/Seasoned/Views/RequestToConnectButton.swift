//
//  RequestToConnectButton.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct RequestToConnectButton: View {
    @State private var isShowingPopup = false
    @State private var text: String = ""
    
    var body: some View {
        
        ZStack {
            Button("Request to Connect"){
                isShowingPopup.toggle()
                    }
            //button look modifiers
                    .padding()
                    .padding(.top, -5)
                    .padding(.bottom, -5)
                    .foregroundColor(.blue)
                    .background(Color(red: 218.0/255.0, green: 235.0/255.0, blue: 2550.0/255.0, opacity: 0.7))
                    .clipShape(RoundedRectangle(cornerRadius:25))
                .fixedSize()
                .padding(.bottom, 175)
                .padding(.leading, 210)
                .padding(.top, 295)
                .padding(.trailing)
        
        //button function
        if isShowingPopup {
            
            ZStack {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack{
                    
                    VStack (alignment: .leading){
                        
                        Text("Add A Note to Your Request")
                            .fontWeight(.semibold)
                            .padding(.top, 15)
                        
                        
                        TextField("Type something here", text: $text, axis: .vertical)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .lineLimit(10, reservesSpace: true)
                            .padding()
                    
                    }
                    
                    HStack{
                        Spacer()
                        
                        Button("Cancel") {
                            isShowingPopup.toggle()
                        }
                        .foregroundStyle(.secondary)
                        
                        
                        
                        Button("Send") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ // make this send message request
                        }
                        .padding()
                        .padding(.top, -5)
                        .padding(.bottom, -5)
                        .foregroundColor(.blue)
                        .background(Color(red: 218.0/255.0, green: 235.0/255.0, blue: 2550.0/255.0, opacity: 0.7))
                        .clipShape(RoundedRectangle(cornerRadius:25))
                    .fixedSize()
                        
                    }
                    
                   
                    
                    Spacer()
                    
                }
                .padding()
                .frame(maxWidth: 350, maxHeight: 400)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
                
            
        }
    }
        
        
    }
}

#Preview {
    RequestToConnectButton()
}
