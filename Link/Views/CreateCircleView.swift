//
//  CreateCircleView.swift
//  Link
//
//  Created by Atul Verma on 7/11/23.
//

import SwiftUI

struct CreateCircleView: View {
    
    @StateObject var viewModel = CreateCircleViewModel()
    @State private var isSideBarOpened = false
    
    var body: some View {
        NavigationStack {
                VStack {
                    Text("New Circle")
                        .foregroundColor(bgColor)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button(action: {
                        viewModel.editImage()
                    }) {
                        Image(systemName: "photo.circle")
                            .font(.system(size: 110))
                            .foregroundColor(bgColor)
                    }
                    
                    SuperTextField(placeholder: Text("Circle Name"), text: $viewModel.circleName)
                        .font(.system(size:18,weight:.bold))
                        .foregroundColor(secondaryColor)
                        .padding()
                        .background(bgColor)
                        .clipShape(Capsule())
                        .padding()
                    
                    //get friends from friends list and display here
                    ScrollView {
                        ForEach(User.MOCK_USERS) { user in
                            NavigationLink(value: user) { FriendPreview(user: user)
                            }
                        }
                    }
                    .fixedSize()
                    .padding()
                    .background(bgColor)
                    .cornerRadius(20)
                    
                    Button(action: {
                        viewModel.createCircle()
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(secondaryColor)
                            .padding(13)
                            .background(bgColor)
                            .clipShape(Circle())
                            .shadow(color: secondaryColor.opacity(8), radius: 6, x: 0, y: 0)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top,15)
                    .padding(.trailing, 15)
                }
                .padding()
        }
    }
}

struct CreateCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCircleView()
    }
}
