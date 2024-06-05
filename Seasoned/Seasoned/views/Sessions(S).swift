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
        // Your scroll view content
      }
      HStack {
        Text("Chats")
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading) // Position top left
    }
  }
}

#Preview {
  Sessions_S_()
}
