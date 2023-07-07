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
            if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
                //signed in
                MapView()
            } else {
                LoginView()
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
