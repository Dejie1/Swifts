//
//  PublicTransportRow.swift
//  Seasoned
//
//  Created by Ryan Walsh on 12/6/2024.
//

import SwiftUI

struct PublicTransportRow: View {
    var image: String
        var title: String
        var description: String

        var body: some View {
            HStack {

                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .underline()


                    Text(description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                Image(systemName: "chevron.right")
            }
        }
    }

    #Preview {
        PublicTransportRow(image: "sydneytrains", title: "Sydney Trains", description: "The train network of Sydney and Greater Syndey.")
    }
