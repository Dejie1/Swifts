//
//  ContentView.swift
//  Seasoned
//
//  Created by De Jie Ang on 31/5/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserViewModel
    var body: some View {
        TabView {
            
            if vm.user?.userType == "Student"{
                SupportAreaView()
                    .tabItem {
                        Label("Support Area", systemImage: "star")
                    }
//                    .environmentObject(vm)
            } else if vm.user?.userType == "Mentor" {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
//                    .environmentObject(vm)
                
            }
            
            MainMessageView()
                .tabItem {
                    Label("Messaging", systemImage: "bubble.left.circle.fill")
                }
//                .environmentObject(UserViewModel())
            
            
            SettingView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
