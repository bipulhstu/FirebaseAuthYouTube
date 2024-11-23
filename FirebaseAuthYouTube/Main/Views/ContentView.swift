//
//  ContentView.swift
//  FirebaseAuthYouTube
//
//  Created by Bipul Islam on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        
        Group{
            if authViewModel.userSession == nil{
                LoginView()
            }else{
                ProfileView()
            }
        }
        .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
