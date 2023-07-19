//
//  HomeView.swift
//  Link
//
//  Created by Atul Verma on 7/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var displayContact = false
    
    var body: some View {
        NavigationStack {
            VStack {
                //button to create new circle
                NavigationLink(destination: {
                    CreateCircleView()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(bgColor)
                        .padding(13)
                        .background(secondaryColor)
                        .clipShape(Circle())
                        .shadow(color: secondaryColor.opacity(8), radius: 5, x: 0, y: 0)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing,10)
                
                HeaderView(text: "Circles")
                //Scroll for circles
                ScrollView {
                    //change to for loop to iterate over all groups user is a part of
                    ForEach(Group.MOCK_GROUPS) { group in
                        NavigationLink(value: group) {
                            CirclePreview(group: group)
                        }
                    }
                }
                .navigationDestination(for: Group.self, destination: {
                    group in CircleView(group: group)
                })
                .padding(10)
                
                HeaderView(text: "Best Friends")
                //Scroll for friends list
                ScrollView {
                    // change to for loop to iterate over all friends of user
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            FriendPreview(user: user)
                        }
                    }
                }
                .navigationDestination(for: User.self, destination: {
                    user in ContactView(user: user, displayContact: $displayContact)
                })
                .padding(10)
            }
            .padding()
        }
    }
}

struct FriendImageView: View {
    
    var user: User
    var frame: CGFloat = 25
    
    var body: some View {
        AsyncImage(
            url: URL(
                string: user.avatar ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: frame,
                               height: frame,
                               alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(bgColor, lineWidth: 1)
                        }
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(3 / 2, contentMode: .fill)
                .shadow(color: secondaryColor,radius: 2)
    }
}

struct CirclePreview: View {
    var group: Group
    
    var body: some View {
            HStack {
                //replace url with group image url
                ImageView(frame: 50)
                    .overlay {
                        Circle().stroke(bgColor, lineWidth: 2)
                    }
                Spacer()
                VStack {
                    Text(group.name)
                        .font(.system(size: 20, weight: .bold))
                    HStack {
                        //loop through group friends list and obtain profile picture urls
                        ForEach(group.users.prefix(3)) { user in
                            FriendImageView(user: user)
                        }

                        if (group.getSize() > 3) {
                            Text("+" + String(group.getSize()-3))
                        }
                    }
                }
                Spacer()
                    
            }
            .frame(minWidth: 0, maxWidth: getReact().width)
            .padding(10)
            .foregroundColor(bgColor)
            .background(secondaryColor)
            .cornerRadius(20)
        }
}

struct FriendPreview: View {

    var user: User
    
    var body: some View {
            HStack {
                //replace url with group image url
                ImageView(url: user.avatar ?? "", frame: 30)
                    .overlay {
                        Circle().stroke(bgColor, lineWidth: 2)
                    }
                    .padding(.trailing,20)

                VStack {
                    Text(user.name)
                        .font(.system(size: 20, weight: .bold))
                    Text("Near" + " [user location]")
                }
                Spacer()
                Button(action: {
                    //call user (if phone number exists on profile)
                }) {
                    Image(systemName: "phone.fill")
                        .font(.system(size: 25))
                        .foregroundColor(bgColor)
                        .padding(5)
                }
                Button(action: {
                    //message user (within app)
                }) {
                    Image(systemName: "message.fill")
                        .font(.system(size: 25))
                        .foregroundColor(bgColor)
                        .padding(5)
                }
            }
            .frame(minWidth: 0, maxWidth: getReact().width-50)
            .padding(10)
            .foregroundColor(bgColor)
            .background(secondaryColor)
            .cornerRadius(20)
        }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
