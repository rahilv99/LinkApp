//
//  LoginView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
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
                                    .fill(secondaryColor)
                                    .offset(x: getReact().width/2, y:-height/1.3)
                                Circle()
                                    .fill(secondaryColor)
                                    .offset(x: -getReact().width/2, y:-height/1.5)
                                Circle()
                                    .fill(bgColor)
                                    .offset(x: 0, y:-height/1.3)
                            }
                        )
                    }
                    .frame(maxHeight:getReact().width)
                    
                    
                    VStack {
                        HeaderView(text: "Login")
                        
                        TextFieldView(text: "Email", binding: $viewModel.email)
                        
                        //change to hidden text field
                        TextFieldView(text: "Password", binding: $viewModel.password)
                        
                        Button(action: {
                            viewModel.forgotPassword()
                        }) {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        .padding(.top,10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Button(action: {
                            viewModel.login()
                        }) {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(secondaryColor)
                                .padding(13)
                                .background(bgColor)
                                .clipShape(Circle())
                                .shadow(color: secondaryColor.opacity(8), radius: 5, x: 0, y: 0)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
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
                                    
                                Text("Login Using Phone Number")
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
                .overlay(
                    VStack {
                        Text("New Around here?")
                        NavigationLink("Create Account", destination: RegisterView())
                            .foregroundColor(secondaryColor)
                    }
                    .padding(.bottom, 10)
                    ,alignment: .bottom
                )
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View{
    func getReact()->CGRect{
        return UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
