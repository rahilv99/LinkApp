//
//  LoginViewModel.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //attempt login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func forgotPassword() {
        guard validate() else {
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                self.errorMessage = error?.localizedDescription ?? ""
                return
            }
            
            self.errorMessage = "Password reset email sent"
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        //chck for arguments entered
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        //email verification
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invaid email address"
            return false
        }
        
        return true
    }
}
