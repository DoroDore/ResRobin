//
//  AuthView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct AuthView: View {
    
    @Environment(AuthController.self) private var authController
    
    var body: some View {
        VStack {
            Spacer()
            GoogleSignInButton(scheme: .dark, style: .standard, state: .normal) {
                signIn()
            }
        }
        .padding()
    }
    
    @MainActor
    func signIn() {
        Task {
            do {
                try await authController.signIn()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    AuthView()
}
