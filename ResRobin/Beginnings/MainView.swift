//
//  MainView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

struct MainView: View {
    // Access the AuthController from the environment
    @Environment(AuthController.self) private var authController
    
    // State to manage which tab is currently selected when authenticated
    @State private var selectedTab: ViewType = .home // Default to Home tab

    var body: some View {
        Group {
            switch authController.authState {
            case .undefined:
                // Show a progress view while authentication state is being determined
                ProgressView("Loading Authentication State...")
            case .authenticated:
                // If authenticated, show the main application content with toolbar
                NavigationStack {
                    VStack {
                        // Display the content view based on the selected tab
                        switch selectedTab {
                        case .home:
                            HomeView()
                        case .stats:
                            StatsView()
                        case .profile:
                            ProfileView()
                        }
                        
                        Spacer() // Pushes content to top, toolbar to bottom

                        // The toolbar for tab navigation
                        ToolbarView(selectedView: $selectedTab)
                    }
                    // This is the key change: Make the VStack ignore the bottom safe area.
                    // This allows the ToolbarView (which also ignores it) to extend fully.
                    .ignoresSafeArea(.all, edges: .bottom)
                }
            case .notAuthenticated:
                // If not authenticated, show the authentication view
                AuthView()
            }
        }
        // Task to start listening to authentication state changes when the view appears
        .task {
            await authController.startListeningToAuthState()
        }
    }
}

#Preview {
    // Provide a mock AuthController for the preview
    MainView()
        .environment(AuthController())
}
