//
//  Sessions(S).swift
//  Seasoned
//
//  Created by Srishti Sirohi on 5/6/2024.
//

import SwiftUI


struct Requests_S_: View {
    var body: some View {
        NavigationView {
            ScrollView{
                
          
            List {
                ForEach(0...10, id: \.self) { message in
                ConnectionRequest()
                }
         }
            .listStyle(PlainListStyle())
                        .frame(height: UIScreen.main.bounds.height - 150)
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                
                            
                                HStack{
                                    
                                    Text("Requests")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                                
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
