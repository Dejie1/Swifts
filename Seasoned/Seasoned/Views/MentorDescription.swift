//
//  MentorDescription.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct MentorDescription: View {
    
    //@EnvironmentObject var viewModel: UserViewModel
  // @ObservedObject var viewModel = UserViewModel()
   // var selectedCategories: [String]
    
    var mentor: Mentor
    
    var body: some View {
        
        //main content screen

            ZStack{
                VStack{
                    
                    MentorImage(image: mentor.image)
                        .padding(.top, -70)
                    
                    VStack (alignment: .leading){
                        //Name and Popup button
                        HStack (alignment: .top){
                            Text(mentor.name)
                                .frame(maxWidth: 185, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.top, -20)
                            
                            
                            Spacer()
                        }
                        .padding(.leading, 15)
                        
                        //description content
                        Text("About")
                            .font(.title3)
                            .padding(.leading)
                            .padding(.top, 1)
                        
                        // specific mentor user data
                        Group{
                            Text("Age: \(mentor.age)")
                            
                            HStack {
                                Text(mentor.course)
                                Spacer()
                                Text(mentor.uni)
                            }
                            
                            //Text("small description")
                        }
                        .foregroundStyle(.secondary)
                        .padding(.leading)
                        .padding(.trailing, 20)
                        .padding(.top, 4)
                        .padding(.bottom, -2)
                        
                        
                        // filtered categories
                        Text("Helps In")
                            .font(.title3)
                            .padding()
                            .padding(.top, 5)
                        
                        HStack{ // to be filter icons
                            Text("Housing")
                                .padding(.leading)
                            
                            Text("Finance")
                            
                            Text("Health")
                            
                            Text("Transport")
                            
                            Text("Events")
                            
                        }
                        
                    }
                }
                .padding()
                
                VStack{
                    RequestToConnectButton()
                }
            }
        }
}

#Preview {
    //MentorDescription(mentor: Mentor [data: [String: Any]])
    let mentorData: [String: Any] = [
                "uid": "1",
                "name": "John Doe",
                "age": 30,
                "uni": "UTS",
                "course": "Bachelor of Computer Science",
                "profileImageUrl": "profile_image_url"
            ]
            let mentor = Mentor(data: mentorData)
            return MentorDescription(mentor: mentor)
        
}

//selectedCategories: [],
