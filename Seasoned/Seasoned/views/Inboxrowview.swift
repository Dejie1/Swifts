//
//  Inboxrowview.swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI


struct ChatItem: Identifiable {
  let id = UUID()
   var profileImage: String // profile image name (e.g. "person.circle.fill")
    var name: String
    var message: String
    var timestamp: String
}

// Create an array of chat items
let chatItems: [ChatItem] = [
    ChatItem(profileImage: "JohnDoe", name: "Harry", message: "Hi I am Harry, Can you please help me with a few things? I am new here.", timestamp: "Wed, 28 June : 2:00 pm"),
    
    ChatItem(profileImage: "DavidGreen", name: "Larry", message: "Hey, how's it going?", timestamp: "Thu, 29 June : 10:00 am"),
    
    ChatItem(profileImage: "JaneSmith", name: "Sally", message: "Hi, I am Sally and I am new.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    ChatItem(profileImage: "DavidGreen", name: "Barry", message: "Hey there, can you help?", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "JohnDoe", name: "Jerry", message: "Hey I am Jerry, Nice to meet you.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "MichaelBrown", name: "Rory", message: "Hi, I need help with something.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "EmilyWhite", name: "Dolly", message: "Hi there, can you please help me?.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "JessicaWilliams", name: "Lolly", message: "Hello, I need help with Housing, Finance", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "DavidGreen", name: "Sorry", message: "Hey I am so Sorry.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "SarahJohnson", name: "Carry", message: "Hey I am Carry from Thailand.", timestamp: "Fri, 30 June : 2:00 pm"),
    
    
    ChatItem(profileImage: "JessicaWilliams", name: "Mary", message: "Hey there, I am Mary.", timestamp: "Fri, 30 June : 2:00 pm"),
    // Add more chat items here
]


struct Inboxrowview: View {
    let chatItem: ChatItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(chatItem.profileImage)
              
           
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            
            VStack(alignment: .leading, spacing: 4){
                
                Text(chatItem.name)
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(chatItem.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: UIScreen.main.bounds.width - 160, alignment: .leading )
                    .truncationMode(.tail)
                   
                Text(chatItem.timestamp)
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            
            HStack{
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.black)
        }
     
        .frame(height:72)
    }
}

struct Inboxrowview_Previews: PreviewProvider {
    
static var previews: some View {
        Inboxrowview(chatItem: chatItems[0])
    }
}
