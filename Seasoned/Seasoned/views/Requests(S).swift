//
//  Sessions(S).swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI

struct Requests_S_: View {
    
    let chatItems: [ChatItem] = [
        ChatItem(profileImage: "DavidGreen", name: "Tim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "DavidGreen", name: "Jim", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "DavidGreen", name: "Sam", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        ChatItem(profileImage: "DavidGreen", name: "Nim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "EmilyWhite", name: "Jill", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "EmilyWhite", name: "Lim", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        ChatItem(profileImage: "SarahJohnson", name: "Dim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "SarahJohnson", name: "Kim", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "SarahJohnson", name: "Pam", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        // Add more chat items here
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                
                List {
                    ForEach(chatItems) { chatItem in
                        ConnectionRequest(chatItem: chatItem)
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 150)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(destination: EmptyView()) {
                            Image(systemName:"chevron.backward")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            Text("Requests")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                        }
                    }
                }
            }
        }
    }
    
    
    
    struct Requests_S_Previews: PreviewProvider {
        static var previews: some View {
            Requests_S_()
            
        }
    }
}
