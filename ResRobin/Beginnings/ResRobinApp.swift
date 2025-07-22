//
//  ResRobinApp.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

@main
struct ResRobinApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var authController = AuthController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(authController)
        }
    }
}
