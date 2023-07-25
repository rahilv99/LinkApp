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
    
    //iterate over users of group, display location data of each user
    //iterate over any current hotspots of map, display location data of each event
    //create event button
    //circle information button, display members, leave group, location permissions of current user (toggle),
    var body: some View {
            NavigationView {
                    VStack {
                        HStack {
                            Text(group.name)
                                .font(.title2)
                                .bold()
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "person.3.sequence")
                                    
                                    .padding()
                            }
                        }
                        Map(coordinateRegion: $viewModel.reigon, showsUserLocation: true)
                            .ignoresSafeArea()
                            .accentColor(Color.red)
                            .onAppear {
                                viewModel.locationAvailable()
                            }
                    }
                //.navigationTitle(group.name)
                //.navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(group: Group.MOCK_GROUPS[0])
    }
}
