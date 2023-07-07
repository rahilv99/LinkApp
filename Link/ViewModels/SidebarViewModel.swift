//
//  SideMenuViewModel.swift
//  Link
//
//  Created by Atul Verma on 6/28/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SidebarViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {return}
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    phone: data["phone"] as? String ?? "",
                    school: data["school"] as? String ?? "",
                    location: data["location"] as? String ?? "",
                    avatar: data["avatar"] as? String ?? "")
            }
        }
    }
}
