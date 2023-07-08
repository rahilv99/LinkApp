//
//  RegisterView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    @State var maxCircleHeight: CGFloat = 0
    
    var body: some View {
            NavigationView {
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
                                    .fill(bgColor)
                                    .offset(x: getReact().width/2, y:-height/1.3)
                                Circle()
                                    .fill(bgColor)
                                    .offset(x: -getReact().width/2, y:-height/1.5)
                                Circle()
                                    .fill(secondaryColor)
                                    .offset(x: 0, y:-height/1.3)
                            }
                        )
                    }
                    .frame(maxHeight:getReact().width)
                    
                    VStack {
                        HeaderView(text: "Register")
                        
                        TextFieldView(text: "Name", binding: $viewModel.name)
                        
                        TextFieldView(text: "Email", binding: $viewModel.email)
                        
                        TextFieldView(text: "Password", binding: $viewModel.password)
                        
                        Button(action: {
                            viewModel.registerWithEmail()
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
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxHeight: .infinity, alignment: .top)
                        }
                        NavigationLink(destination: {
                            RegisterWithPhoneView()
                        }) {
                            HStack {
                                Image(systemName: "phone")
                                    .font(.title)
                                    .frame(width: 20,height: 20, alignment: .trailing)
                                    
                                Text("Register Using Phone Number")
                                    .font(.system(size: 20, weight: .bold))
                                    
                            }
                            .frame(minWidth: 0, maxWidth: getReact().width-50)
                            .padding(15)
                            .foregroundColor(secondaryColor)
                            .background(bgColor)
                            .cornerRadius(20)
                            .padding(.top,20)
                            .shadow(color: secondaryColor.opacity(8), radius: 6, x: 0, y: 0)
                        }
                        
                    }
                    .padding()
                    .padding(.top,-maxCircleHeight/1.5)
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                }
                .background(
                    HStack {
                        Circle()
                            .fill(secondaryColor)
                            .frame(width: 80, height: 80)
                            .offset(x:-30,y:0)
                        Spacer()
                        Circle()
                            .fill(bgColor)
                            .frame(width: 110, height: 110)
                            .offset(x:20,y:0)
                    }
                    .offset(y:getSafeArea().bottom+30)
                    ,alignment: .bottom
                )
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

