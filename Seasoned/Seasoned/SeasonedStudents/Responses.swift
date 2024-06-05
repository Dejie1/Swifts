//
//  Responses.swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI

struct Responses: View {
    
   
    
    var body: some View {
       
        
        
        TabView{
            
        
            ViewA()
                .tabItem () {
                    Image(systemName: "house.fill")
                    Text("Home")
                    
                }
            
            ViewB()
                .tabItem () {
                    Image(systemName: "ellipsis.message")
                    Text("Messages")
                    
                }
            
            ViewC()
                .tabItem () {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                    
                }
        }
    }
}

#Preview {
    Responses()
}
