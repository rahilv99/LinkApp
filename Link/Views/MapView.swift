//
//  MapView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//


import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel = MapViewModel()
    @State private var isSideBarOpened = false
    
    var body: some View {
        ZStack {
            NavigationView {
                Map(coordinateRegion: $viewModel.reigon, showsUserLocation: true)
                    .ignoresSafeArea()
                    .accentColor(Color.red)
                    .onAppear {
                        viewModel.locationAvailable()
                    }
            }
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
