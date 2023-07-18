//
//  SidebarView.swift
//  Link
//
//  Created by Atul Verma on 6/28/23.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var isSidebarVisible: Bool
    @StateObject var viewModel = SidebarViewModel()

    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }

            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
                MenuChevron

                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                    MenuLinks(items: userActions)
                    Divider()
                    MenuLinks(items: profileActions)
                    logout
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            .onAppear {
                viewModel.fetchUser()
            }

            Spacer()
        }
    }

    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(bgColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -10)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }

            Image(systemName: "chevron.right")
                .foregroundColor(secondaryColor)
                .rotationEffect(isSidebarVisible ?
                    Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }

    var userProfile: some View {
        VStack(alignment: .leading) {
            HStack {
                if let user = viewModel.user {
                    ImageView(frame: 50)
                            .padding(.trailing, 18)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(user.name)
                            .foregroundColor(.white)
                            .bold()
                            .font(.title3)
                        Text(user.email)
                            .foregroundColor(secondaryColor)
                            .font(.caption)
                    }
                } else {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    var logout: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Image(systemName: "iphone.and.arrow.forward")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(secondaryColor)
                    .padding(.trailing, 18)
                Button(action: {
                    viewModel.signOut()
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                print("Tapped on logout")
            }
        }
        .padding(.leading, 8)
    }
}

struct MenuItem: Identifiable {
    var id: Int
    var icon: String
    var text: String
    var destination: AnyView = AnyView(EmptyView())
}

var userActions: [MenuItem] = [
    MenuItem(id: 4001, icon: "person.circle.fill", text: "My Profile", destination: AnyView(CurrentUserProfileView())),
    MenuItem(id: 4002, icon: "pencil", text: "Edit Account", destination: AnyView(EditProfileView())),
    MenuItem(id: 4003, icon: "person.2.fill", text: "Friends", destination: AnyView(FriendsListView())),
    MenuItem(id: 4004, icon: "message.fill", text: "Messages", destination: AnyView(FriendsListView()))
]

var profileActions: [MenuItem] = [
    MenuItem(id: 4005, icon: "wrench.and.screwdriver.fill", text: "Preferneces", destination: AnyView(SettingsView()))
]

struct MenuLinks: View {
    var items: [MenuItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(items) { item in
                menuLink(icon: item.icon, text: item.text, destination: item.destination)
            }
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
    }
}

struct menuLink: View {
    var icon: String
    var text: String
    var destination: AnyView = AnyView(EmptyView())
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(secondaryColor)
                .padding(.trailing, 18)
            NavigationLink(text, destination: destination)
                .foregroundColor(.white)
        }
        .onTapGesture {
            print("Tapped on \(text)")
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isSidebarVisible: .constant(true))
    }
}
