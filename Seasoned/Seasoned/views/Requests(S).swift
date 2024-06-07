//
//  Sessions(S).swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI

struct Requests_S_: View {
    let chatItems: [ChatItem] = [
        ChatItem(profileImage: "EmilyWhite", name: "Tim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "image2", name: "Jim", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "image3", name: "Sam", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        ChatItem(profileImage: "image1", name: "Nim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "image2", name: "Jill", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "image3", name: "Lim", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        ChatItem(profileImage: "image1", name: "Dim", message: "Hi, I'm John", timestamp: "Wed, 28 June - 2:00 pm - 3:00 pm"),
        ChatItem(profileImage: "image2", name: "Kim", message: "Hey, how's it going?", timestamp: "Thu, 29 June - 10:00 am"),
        ChatItem(profileImage: "image3", name: "Pam", message: "Hi, I need help with a project.", timestamp: "Fri, 30 June - 2:00 pm"),
        // Add more chat items here
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(chatItems) { chatItem in
                    ConnectionRequest(chatItem: chatItem)
                }
            }
            .listStyle(PlainListStyle())
            .frame(height: UIScreen.main.bounds.height - 150)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text("Requests")
                            .font(.title)
                            .fontWeight(.bold)
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
