//
//  RequestToConnectButton.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct RequestToConnectButton: View {
    
    @State private var isShowingPopup = false
    
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
                .padding(.leading, 170)
        
        //button function
        if isShowingPopup {
            ConnectButtonPopupView()
                .onTapGesture {
                    isShowingPopup = false
                    //closing the popup when tapping outside of it
                }
            
        }
    }
        
        
    }
}

#Preview {
    RequestToConnectButton()
}
