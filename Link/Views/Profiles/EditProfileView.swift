//
//  AccountView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel = EditProfileViewModel()
    @State var maxCircleHeight: CGFloat = 0
    
    var body: some View {
        
        NavigationView {
            ZStack {
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
                        ImageView(frame: 150)
                        
                        Spacer()
                        
                        if let user = viewModel.user {

                        EditField(field: "Name", placeholder: user.name, binding: $viewModel.newName)
                        EditField(field: "Email", placeholder: user.email, binding: $viewModel.newEmail)
                        EditField(field: "Phone", placeholder: user.phone ?? "", binding: $viewModel.newPhone)
                        EditField(field: "School", placeholder: user.school ?? "", binding: $viewModel.newSchool)
                            
                            Button("Save", action: viewModel.newValues)
                                .buttonStyle(Button1())
                                .padding(.top,10)
                                .padding(.bottom, 50)
                        } else {
                            ProgressView()
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

struct EditField: View {
    
    var field: String
    var placeholder: String
    var binding: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(field)
                .fontWeight(.bold)
                .foregroundColor(bgColor)
            HStack {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(bgColor)
                    .padding(.trailing, 18)
                    .foregroundColor(.white)
                SuperTextField(placeholder: Text(placeholder).foregroundColor(bgColor),
                               text: binding)
            }
            Divider()
                .background(bgColor)
        })
        .padding(.top,25)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
