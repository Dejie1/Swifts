//
//  MainView.swift
//  Seasoned
//
//  Created by De Jie Ang on 5/6/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            if userViewModel.isUserCurrentlyLoggedOut {
                LoginView(didCompleteLoginProcess: handleLoginCompletion)
            } else if userViewModel.user?.name == nil {
                UserDetailsView()
            } else if userViewModel.user?.userType == "Mentor" && !(userViewModel.user?.hasSelectedCategories ?? false) {
                SupportAreaView()
            } else {
                ContentView()
            }
        }
        .onAppear {
            userViewModel.fetchCurrentUser()
        }
    }
    
    private func handleLoginCompletion() {
        userViewModel.fetchCurrentUser()
    }
}

