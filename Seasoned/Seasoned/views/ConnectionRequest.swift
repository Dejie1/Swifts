//
//  ConnectionRequest.swift
//  Seasoned
//
//  Created by Srishti Sirohi on 6/6/2024.
//

import SwiftUI

struct ConnectionRequest: View {
    let chatItem: ChatItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(chatItem.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 70, height:70)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            
            VStack(alignment: .leading, spacing: 4){
                
                Text(chatItem.name)
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("Wants to Connect")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: UIScreen.main.bounds.width - 150, alignment: .leading )
                        .truncationMode(.tail)
                    Image(systemName: "chevron.right")
                        .baselineOffset(0)
                    
                    
                }
                
            }
        }
    }
}
    struct ConnectionRequest_Previews: PreviewProvider{
        
        static var previews: some View{
            let sampleChatItem = ChatItem(profileImage: "person.circle.fill", name: "Tim", message: "", timestamp: "")
            return ConnectionRequest(chatItem: sampleChatItem)
           // ConnectionRequest( chatItem: <#ChatItem#>)
        }
    }

