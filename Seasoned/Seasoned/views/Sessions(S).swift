//
//  Sessions(S).swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI


struct Sessions_S_: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
                
                List{
                    ForEach(chatItems) { chatItem in
                        Inboxrowview(chatItem: chatItem)                    }
                    
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 150)
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        NavigationLink(destination: EmptyView()) {
                            Image(systemName:"chevron.backward")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                        Text("Sessions")
                            .font(.title)
                            .bold()
                        
                    }
                    
                    
                    
                }
            }
            
            
        }
    }
    
    struct Sessions_S_Previews: PreviewProvider {
        static var previews: some View {
            Sessions_S_()
            
        }
    }
}