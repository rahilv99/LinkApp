//
//  CreateCircleViewModel.swift
//  Link
//
//  Created by Atul Verma on 7/12/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class CreateCircleViewModel: ObservableObject {
    
    @Published var locationEnabled: Bool = true
    @Published var circleName: String = ""
    
    init() {}
    
    private func insertCircleRecord(id: String) {
        /*
        let newCircle = Group(id: id,
                              users: <#T##[User]#>,
                              //not sure if this is correct
                              owner: Auth.auth().currentUser?.uid,
                              locationPermissions: locationEnabled)
        
        let db = Firestore.firestore()
        db.collection("circles")
            .document(id)
            .setData(newCircle.asDictionary())
        */
    }
    
    func editImage() {
        
    }
    
    func createCircle() {
        
    }
}
