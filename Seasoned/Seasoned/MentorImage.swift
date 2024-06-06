//
//  MentorImage.swift
//  Seasoned
//
//  Created by Cicely Lomas on 5/6/2024.
//

import SwiftUI

struct MentorImage: View {
    
    var body: some View {
        Image("JohnDoe")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            .frame(width: 400, height: 500, alignment: .center)
    }
}

#Preview {
    MentorImage()
}
