//
//  AccountView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State var maxCircleHeight: CGFloat = 0
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                bgColor
                VStack {
                    
                    GeometryReader { proxy -> AnyView in
                        
                        let height = proxy.frame(in: .global).height
                        
                        DispatchQueue.main.async {
                            if maxCircleHeight == 0 {
                                maxCircleHeight = height
                            }
                        }
                        
                        return AnyView(
                            ZStack {
                                Circle()
                                    .fill(secondaryColor)
                                    .offset(x: getReact().width/2, y:-height/1.3)
                                Circle()
                                    .fill(secondaryColor)
                                    .offset(x: -getReact().width/2, y:-height/1.5)
                                Circle()
                                    .fill(.gray)
                                    .offset(x: 0, y:-height/1.3)
                            }
                        )
                    }
                    .frame(maxHeight:getReact().width)
                    
                    VStack {
                        AsyncImage(
                            url: URL(
                                string: "https://picsum.photos/100")) { image in
                                    image
                                        .resizable()
                                        .frame(width: 150,
                                               height: 150,
                                               alignment: .center)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(secondaryColor, lineWidth: 2)
                                        }
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(3 / 2, contentMode: .fill)
                                .shadow(color: secondaryColor,radius: 4)
                                .padding(.trailing, 18)
                        
                        Spacer()
                        
                        if let user = viewModel.user {
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text("Name")
                                    .fontWeight(.bold)
                                    .foregroundColor(secondaryColor)
                                HStack {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(secondaryColor)
                                        .padding(.trailing, 18)
                                        .foregroundColor(.white)
                                    SuperTextField(placeholder: Text(user.name).foregroundColor(secondaryColor),
                                                   text: $viewModel.newName)
                                }
                                Divider()
                                    .background(secondaryColor)
                            })
                            .padding(.top,25)
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text("Email")
                                    .fontWeight(.bold)
                                    .foregroundColor(secondaryColor)
                                HStack {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(secondaryColor)
                                        .padding(.trailing, 18)
                                        .foregroundColor(.white)
                                    SuperTextField(placeholder: Text(user.email).foregroundColor(secondaryColor),
                                                   text: $viewModel.newEmail)
                                }
                                Divider()
                                    .background(secondaryColor)
                            })
                            .padding(.top,25)
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text("Phone")
                                    .fontWeight(.bold)
                                    .foregroundColor(secondaryColor)
                                HStack {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(secondaryColor)
                                        .padding(.trailing, 18)
                                        .foregroundColor(.white)
                                    SuperTextField(placeholder: Text(user.phone).foregroundColor(secondaryColor),
                                                   text: $viewModel.newPhone)
                                }
                                Divider()
                                    .background(secondaryColor)
                            })
                            .padding(.top,25)
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text("School")
                                    .fontWeight(.bold)
                                    .foregroundColor(secondaryColor)
                                HStack {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(secondaryColor)
                                        .padding(.trailing, 18)
                                        .foregroundColor(.white)
                                    SuperTextField(placeholder: Text(user.school).foregroundColor(secondaryColor),
                                                   text: $viewModel.newSchool)
                                }
                                Divider()
                                    .background(secondaryColor)
                            })
                            .padding(.top,25)
                            
                            Button("Save", action: viewModel.newValues)
                                .buttonStyle(Button1())
                                .padding(.top,10)
                                .padding(.bottom, 50)
                        } else {
                            ProgressView()
                                .foregroundColor(secondaryColor)
                                .frame(width: 150, height: 150, alignment: .center)
                        }
                        
                        }
                            .padding()
                            .padding(.top,-maxCircleHeight/1.5)
                            .padding(.bottom, 50)
                            .frame(maxHeight: .infinity, alignment: .top)
                }
                .onAppear {
                    viewModel.fetchUser()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct Button1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(secondaryColor)
            .foregroundStyle(bgColor)
            .bold()
            .clipShape(Capsule())
    }
}

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
