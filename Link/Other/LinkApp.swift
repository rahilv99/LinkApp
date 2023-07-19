//
//  LinkApp.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import FirebaseCore
import SwiftUI

@main
struct LinkApp: App {
    init() {
        FirebaseApp.configure()
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
