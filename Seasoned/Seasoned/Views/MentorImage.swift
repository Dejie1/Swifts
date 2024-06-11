//
//  MentorImage.swift
//  Seasoned
//
//  Created by Cicely Lomas on 6/6/2024.
//

import SwiftUI

struct MentorImage: View {
    var body: some View {
        Image("JohnDoe")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius:25))
            .frame(width: 300, height: 400, alignment: .center)
    }
}

#Preview {
    MentorImage()
}
