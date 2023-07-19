//
//  ContactView.swift
//  Link
//
//  Created by Atul Verma on 7/12/23.
//

import SwiftUI

struct ContactView: View {
    
    let user: User
    
    @Binding var displayContact: Bool
    @StateObject var viewModel = SidebarViewModel()

    var popUpHeight = UIScreen.main.bounds.size.height * 0.35
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(displayContact ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: displayContact)
            .onTapGesture {
                displayContact.toggle()
            }

            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
                HStack {
                    ImageView(url:user.avatar ?? "",frame: 80)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(secondaryColor)
                        
                        if let school = user.school {
                            Text(school)
                                .font(.headline)
                                .foregroundColor(secondaryColor)
                        }
                    }
                    Spacer()
                    
                    // if already friend, switch to remove button
                    Button(action: {
                        //add friend
                        //or remove (conditional)
                    }) {
                        Text("Add")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(bgColor)
                            .padding(15)
                            .background(secondaryColor)
                            .clipShape(Capsule())
                            .shadow(color: secondaryColor.opacity(8), radius: 5, x: 0, y: 0)
                    }
                    .padding()
                    
                    if let self = viewModel.user {
                        
                        //if not friends, display common friends
                        
                        if let friends = user.friends, let self_friends = self.friends {
                            if !self.friends!.contains(user) {
                                HStack {
                                    Text("Common Friends:")
                                        .padding()
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 20) {
                                            ForEach(friends) {user in
                                                if self_friends.contains(user) {
                                                    FriendImageView(user: user, frame: 50)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        //if friends, display common circles, phone, message, notification settings (off/on)
                    }
                }
                
            }
            .frame(height: popUpHeight)
            .offset(y: displayContact ? 0 : -popUpHeight)
            .animation(.default, value: displayContact)
            .cornerRadius(20)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(user: User.MOCK_USERS[0], displayContact: .constant(true))
    }
}
