//
//  User.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let email: String
    var phone: String?
    var school: String?
    var location: String?
    var avatar: String?
    var friends: [User]?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, name: "Robert", email: "robert@gmail.com", phone: "301-301-3011", school: "Duke", location: "Durham", avatar: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Jack", email: "jack@gmail.com", phone: "301-301-3012", school: "Duke", location: "Durham", avatar: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Alex", email: "alex@gmail.com", phone: "301-301-3013", school: "Tennesse", location: "Durham", avatar: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Ryan", email: "ryan@gmail.com", phone: "301-301-3014", school: "Tennesse", location: "Durham", avatar: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Jason", email: "jason@gmail.com", phone: "301-301-3015", school: "Duke", location: "Durham", avatar: "https://picsum.photos/100")
    ]
}
