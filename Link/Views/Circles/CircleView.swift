//
//  CirclesView.swift
//  Link
//
//  Created by Atul Verma on 6/29/23.
//

import SwiftUI
import MapKit

struct CircleView: View {
    
    let group: Group
    @StateObject var viewModel = MapViewModel()
    
    var body: some View {
            NavigationView {
                VStack {
                    Map(coordinateRegion: $viewModel.reigon, showsUserLocation: true)
                        .ignoresSafeArea()
                        .accentColor(Color.red)
                        .onAppear {
                            viewModel.locationAvailable()
                        }
                }
                .navigationTitle(group.name)
                .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(group: Group.MOCK_GROUPS[0])
    }
}
