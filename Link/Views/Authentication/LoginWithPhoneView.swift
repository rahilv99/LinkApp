//
//  LoginWithPhoneView.swift
//  Link
//
//  Created by Jack Steel on 7/12/23.
//

import SwiftUI

struct LoginWithPhoneView: View {
    @StateObject var loginModel: LoginWithPhoneModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "Triangle")
                    .font(.system(size: 38))
                    .foregroundColor(.indigo)
                
                (Text("Welcome,")
                    .foregroundColor(.black) +
                Text("\nLogin to continue")
                    .foregroundColor(.gray)
                )
                .font(.title)
                .fontWeight(.semibold)
                .lineSpacing(10)
                .padding(.top,20)
                .padding(.trailing,15)
                
                CustomTextFieldView(hint: "+1 6505551111", text: $loginModel.mobileNo)
                    .disabled(loginModel.showOTPField)
                    .opacity(loginModel.showOTPField ? 0.4 : 1)
                    .overlay(alignment: .trailing, content: {
                        Button("Change"){
                            withAnimation(.easeInOut){
                                loginModel.showOTPField = false
                                loginModel.otpCode = ""
                                loginModel.CLIENT_CODE = ""
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.indigo)
                        .opacity(loginModel.showOTPField ? 1 : 0)
                        .padding(.trailing,15)
                    })
                    .padding(.top,50)
                
                CustomTextFieldView(hint: "OTP Code", text: $loginModel.otpCode)
                    .disabled(!loginModel.showOTPField)
                    .opacity(!loginModel.showOTPField ? 0.4 : 1)
                    .padding(.top,20)
                
                Button(action: loginModel.showOTPField ? loginModel.verifyOTPCode
                    : loginModel.getOTPCode) {
                    HStack(spacing: 15){
                        Text(loginModel.showOTPField ? "Verify Code" : "Get Code")
                            .fontWeight(.semibold)
                            .contentTransition(.identity)
                        
                        Image(systemName: "line.diagonal.arrow")
                            .font(.title3)
                            .rotationEffect(.init(degrees: 45))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal,25)
                    .padding(.vertical)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.black.opacity(0.05))
                    }
                }
                .padding(.top,30)
            }
            .padding(.leading,60)
            .padding(.vertical,15)
        }
        .alert(loginModel.errorMessage, isPresented: $loginModel.showError) {
        }
    }
}
/*
 struct LoginWithPhoneView: View {
 
 var viewModel = LoginWithPhoneModel()
 var maxCircleHeight: CGFloat = 0
 
 var body: some View {
 NavigationView {
 VStack {
 VStack {
 HeaderView(text: "Phone Login")
 
 TextFieldView(text: "Phone Number", binding: viewModel.phoneNumber)
 
 
 TextFieldView(text: "Code", binding: viewModel.smsCode)
 
 Button(action: {
 viewModel.startAuth()
 }) {
 HStack {
 Image(systemName: "phone")
 .font(.title)
 .frame(width: 20, height: 20, alignment: .trailing)
 
 Text("Send Code")
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
 
 }
 }
 
 struct LoginWithPhoneView_Previews: PreviewProvider {
 static var previews: some View {
 LoginWithPhoneView()
 }
 }
 }
 */
