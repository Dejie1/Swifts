//
//  ContentView.swift
//  Seasoned
//
//  Created by De Jie Ang on 31/5/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserViewModel
    @Binding var selectedTab: Int // Add a @State variable to control the selected tab
    var body: some View {
        TabView(selection: $selectedTab) {  // Bind the TabView's selection to the @State variable
            
            if vm.user?.userType == "Student" {
                SupportAreaView()
                    .tabItem {
                        Label("Support Area", systemImage: "star")
                    }
                    .tag(0)  // Assign a tag to each tab for identification
            } else if vm.user?.userType == "Mentor" {
                MentorHomeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                    .environmentObject(vm)
            }
            
            MainMessageView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(1)  // Assign a different tag for the Messages tab
                .environmentObject(UserViewModel())
            
            GuideView()
                .tabItem {
                    Label("Guides", systemImage: "book.closed")
                }
                .tag(2)  // Assign a different tag for the Guides tab
        }
        .tabViewStyle(DefaultTabViewStyle())
        .tint(.blue)
    }
}

//#Preview {
//    ContentView(selectedTab: $selectedTa )
//        .environmentObject(UserViewModel())
//}
