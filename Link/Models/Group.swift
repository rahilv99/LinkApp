//
//  Circle.swift
//  Link
//
//  Created by Atul Verma on 7/11/23.
//

import Foundation

struct Group: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var users: [User]
    var owner: User
    var locationPermissions: Bool?
    var image: String?
    
    
    func getSize() -> Int {
        return users.count
    }
}

extension Group {
    static var MOCK_GROUPS: [Group] = [
        .init(id: NSUUID().uuidString, name: "Duke Friends", users: [User.MOCK_USERS[0],User.MOCK_USERS[1],User.MOCK_USERS[2],User.MOCK_USERS[3]], owner: User.MOCK_USERS[0], locationPermissions: true, image: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Home Friends", users: [User.MOCK_USERS[0],User.MOCK_USERS[1],User.MOCK_USERS[2],User.MOCK_USERS[3]], owner: User.MOCK_USERS[0], locationPermissions: true, image: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Family", users: [User.MOCK_USERS[2],User.MOCK_USERS[3],User.MOCK_USERS[4]], owner: User.MOCK_USERS[2], locationPermissions: true, image: "https://picsum.photos/100"),
        .init(id: NSUUID().uuidString, name: "Work Friends", users: [User.MOCK_USERS[4],User.MOCK_USERS[0],User.MOCK_USERS[2]], owner: User.MOCK_USERS[4], locationPermissions: true, image: "https://picsum.photos/100")
    ]
}
