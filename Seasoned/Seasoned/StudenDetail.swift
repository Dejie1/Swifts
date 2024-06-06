//
//  StudenDetail.swift
//  Seasoned
//
//  Created by Ryan Walsh on 6/6/2024.
//

import SwiftUI

struct StudenDetail: View {
    @State private var message : String = ""
    
    var body: some View {
        VStack {
            Text("Student Name")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            
            Image("placeholder")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 275)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Student, UTS")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Bachelor of Law and Bachelor of Medical Science")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                        Spacer()
                    
                }
                .padding([.horizontal, .top])
                
            }
            
            TextField("Example: Hey, can we meet up to discuss finance and health?", 
                      text: $message, axis: .vertical)
                .lineLimit(6, reservesSpace: true)
                .padding([.horizontal, .bottom])
                .textFieldStyle(.roundedBorder)
            //this is going to display a message from the student, not let a mentor type a message so what do we do?
            
            HStack {
                Button(action: {
                    print("Decline")
                }, label: {
                    Text("Decline")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .background(.white)
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.gray,lineWidth: 1))
                })
                .frame(width: 90, height: 50)
                .padding(.horizontal, 10)
                
                Button(action: {
                    print("Accept")
                }, label: {
                    Text("Accept")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                        .background(.blue)
                })
                .frame(width: 120, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .padding(.horizontal, 10)
                
                Button(action: {
                    print("Share")
                }, label: {
                        Text("Share")
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .background(.white)
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.blue,lineWidth: 1))
                })
                .frame(width: 90, height: 50)
                .padding(.horizontal, 10)
               
            }
            .padding(.top)
        }
    }
}

#Preview {
    StudenDetail()
}
