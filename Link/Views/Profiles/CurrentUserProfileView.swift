//
//  CurrentUserProfileView.swift
//  Link
//
//  Created by Atul Verma on 7/17/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = MapViewModel()
    @State private var isSideBarOpened = false
    
    var body: some View {
        ZStack {
            VStack {
                
            }
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
