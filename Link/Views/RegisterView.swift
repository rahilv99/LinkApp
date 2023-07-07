//
//  RegisterView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var RegisterModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Name", text: $RegisterModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
            
            TextField("Email", text: $RegisterModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
            TextField("Phone Number", text: $RegisterModel.phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
            SecureField("Password", text: $RegisterModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
            SecureField("Confirm Password", text: $RegisterModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
            
            if !RegisterModel.errorMessage.isEmpty {
                Text(RegisterModel.errorMessage)
                .foregroundColor(.red)
            }
            
            Button(action: {
                RegisterModel.registerWithEmail()
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

