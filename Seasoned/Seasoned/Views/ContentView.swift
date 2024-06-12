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
                    .environmentObject(vm)
            } else if vm.user?.userType == "Mentor" {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .environmentObject(vm)
                
            }
            
            MainMessageView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .environmentObject(UserViewModel())
            
            
            SettingView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
