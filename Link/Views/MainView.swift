//
//  ContentView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            //if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
                //signed in
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    ExploreFriendsView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                    FriendsListView()
                        .tabItem {
                            Image(systemName: "person.2")
                        }
                    MessagesView()
                        .tabItem {
                            Image(systemName: "message.fill")
                        }
                    CurrentUserProfileView(user: User.MOCK_USERS[0])
                        .tabItem {
                            Image(systemName: "person.circle")
                        }
                }
           // } else {
           //     LoginView()
           // }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
