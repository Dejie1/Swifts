//
//  ConnectionRequest.swift
//  Seasoned
//
//  Created by Srishti Sirohi on 6/6/2024.
//

import SwiftUI

struct ConnectionRequest: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: "person.circle.fill")
            
                .resizable()
                .frame(width: 60, height:60)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 4){
             
                Text("Tim")
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("Wants to Connect")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: UIScreen.main.bounds.width - 120, alignment: .leading )
                        .truncationMode(.tail)
                    Image(systemName: "chevron.right")
                        .baselineOffset(0)
                    
                    
                }
                
            }
        }
    }
    
    struct ConnectionRequest_Previews: PreviewProvider{
        static var previews: some View{
            ConnectionRequest()
        }
    }
}
