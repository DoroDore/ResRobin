//
//  HomeView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

struct HomeView: View {
    // Access the AuthController from the environment
    @Environment(AuthController.self) private var authController
    
    var body: some View {
        VStack {
            Spacer() // Pushes content to the center/top
            Image(systemName: "hand.wave.fill") // A friendly SF Symbol
                .imageScale(.large)
                .font(.system(size: 60)) // Make the icon larger
                .foregroundStyle(.orange) // Give it a nice color
            Text("Hello, Authenticated User!") // More specific greeting
                .font(.title)
                .padding(.top, 10)
            Text("This is your home dashboard.")
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer() // Pushes content to the center/bottom
            
            Button("Sign out") {
                signOut()
            }
            .buttonStyle(.borderedProminent) // Modern button style
            .tint(.red) // Red tint for sign out
        }
        .padding()
        .navigationTitle("Home") // Set navigation title for this view
    }
    
    // Function to handle user sign out
    func signOut() {
        do {
            try authController.signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
            // Potentially show an alert to the user here
        }
    }
}

#Preview {
    // Provide a mock AuthController for the preview
    HomeView()
        .environment(AuthController())
}
