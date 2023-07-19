//
//  ExploreFriendsView.swift
//  Link
//
//  Created by Atul Verma on 7/16/23.
//

import SwiftUI

struct ExploreFriendsView: View {
    
    @State private var searchText:String = ""
    @State private var displayContact = false
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView {
                    //iterate over first 20 users in database, filter by name
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            UserPreview(user: user)
                        }
                    }
                }
                .navigationDestination(for: User.self, destination: {
                    user in ContactView(user: user, displayContact: $displayContact)
                })
            }
        }
        .searchable(text: $searchText, prompt: "Find Friends")
        
        //add invite from contacts card
    }
    /*
    var searchResults: [String] {
            if searchText.isEmpty {
                return names
            } else {
                return names.filter { $0.contains(searchText) }
            }
        }
     */
}

struct UserPreview: View {
    //user id
    var user: User
    
    var body: some View {
            HStack {
                //replace url with user image url
                ImageView(url: user.avatar ?? "", frame: 30)
                    .padding(.trailing,20)
                Text(user.name)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                
                //add an on-click animation to this button
                Button(action: {
                    //add friend
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 25, weight: .bold))
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

struct ExploreFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreFriendsView()
    }
}
