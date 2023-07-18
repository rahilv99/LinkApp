//
//  ContactView.swift
//  Link
//
//  Created by Atul Verma on 7/12/23.
//

import SwiftUI

struct ContactView: View {
    
    let user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(user: User.MOCK_USERS[0])
    }
}
