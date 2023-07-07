//
//  RegisterViewModel.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
    
class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func registerWithEmail() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           phone: phone,
                           school: "UNKNOWN",
                           //fix location later
                           location: "IN PROGRESS",
                           avatar: "https://picsum.photos/100")
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invaid email address"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Please try a longer password"
            return false
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords don't match"
            return false
        }
            
        return true
    }
}
