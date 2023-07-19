//
//  CurrentUserProfileView.swift
//  Link
//
//  Created by Atul Verma on 7/17/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    @State private var isSideBarOpened = false
    
    var body: some View {
        ZStack {
            ZStack {
                secondaryColor
                VStack {
                    ImageView(url:user.avatar ?? "",frame: 150)
                        .padding(.top, 55)
                    VStack {
                        Text(user.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(bgColor)
                            
                        if let school = user.school {
                            Text(school)
                                .font(.headline)
                                .foregroundColor(bgColor)
                        }
                    }
            
                    ZStack {
                        Color.white
                        VStack {
                            
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .cornerRadius(20)
                    .frame(width: getReact().width,height: getReact().height/1.6)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .shadow(radius: 3)
                }
            }
            .ignoresSafeArea()
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
