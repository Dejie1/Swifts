//
//  MentorImage.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct MentorImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius:25))
            .frame(width: 300, height: 400, alignment: .center)
    }
}

#Preview {
    MentorImage(image: Image(systemName: "person.fill"))
}
