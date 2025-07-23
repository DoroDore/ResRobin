//
//  FirestoreService.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import Foundation
import FirebaseFirestore // This now includes Codable support
import FirebaseAuth // To get the current user's UID

// An observable class to manage all Firestore interactions.
// We use @Observable here so SwiftUI views can react to changes in its properties (e.g., loading states).
@Observable
class FirestoreService {
    // A reference to the Firestore database instance.
    let db = Firestore.firestore() // Made internal for easier access in related views for now

    // MARK: - User Profile Management

    /// Checks if a user's profile document exists in Firestore.
    /// - Parameter userId: The Firebase Authentication UID of the user.
    /// - Returns: `true` if the user document exists, `false` otherwise.
    func doesUserProfileExist(userId: String) async throws -> Bool {
        // Construct the document reference for the user's profile.
        // We'll store user profiles in a collection named "users"
        // where the document ID is the user's Firebase UID.
        let userDocRef = db.collection("users").document(userId)

        do {
            // Attempt to fetch the document.
            let documentSnapshot = try await userDocRef.getDocument()
            // If the document exists, it means the profile exists.
            return documentSnapshot.exists
        } catch {
            // Log any errors during the fetch operation.
            print("Error checking user profile existence for \(userId): \(error.localizedDescription)")
            throw error // Re-throw the error for the caller to handle
        }
    }

    /// Fetches a user's profile document from Firestore.
    /// - Parameter userId: The Firebase Authentication UID of the user.
    /// - Returns: A `User` object if the profile exists and can be decoded, otherwise `nil`.
    func fetchUserProfile(userId: String) async throws -> User? {
        let userDocRef = db.collection("users").document(userId)

        do {
            // FIX: First, get the DocumentSnapshot from the DocumentReference
            let documentSnapshot = try await userDocRef.getDocument()
            
            // Then, call data(as:) on the DocumentSnapshot
            let user = try documentSnapshot.data(as: User.self)
            return user
        } catch {
            print("Error fetching user profile for \(userId): \(error.localizedDescription)")
            throw error // Re-throw the error
        }
    }

    /// Creates a new user profile document in Firestore.
    /// - Parameter user: The `User` object to store.
    /// - Throws: An error if the document cannot be written.
    func createUserProfile(user: User) async throws {
        // Ensure the user has an ID (Firebase UID) before attempting to set the document.
        guard let userId = user.id else {
            print("Error: User object must have an ID (Firebase UID) to create a profile.")
            throw FirestoreError.missingUserID // Custom error for clarity
        }

        let userDocRef = db.collection("users").document(userId)

        do {
            // Set the document using the Codable object.
            // FirebaseFirestore now has setData(from: ) for Codable support.
            try userDocRef.setData(from: user)
            print("User profile created successfully for \(userId)")
        } catch {
            print("Error creating user profile for \(userId): \(error.localizedDescription)")
            throw error // Re-throw the error
        }
    }

    // MARK: - RobinNest Management (Placeholder for now, will be implemented in views)

    // You'll add functions here later for:
    // - createRobinNest(robinNest: RobinNest)
    // - joinRobinNest(code: String, userId: String)
    // - fetchRobinNest(code: String)

    // Custom error type for FirestoreService
    enum FirestoreError: Error, LocalizedError {
        case missingUserID
        case robinNestCodeAlreadyExists // Updated error name
        case robinNestNotFound // Updated error name
        case userAlreadyInRobinNest // Updated error name

        var errorDescription: String? {
            switch self {
            case .missingUserID:
                return "User ID is required to perform this operation."
            case .robinNestCodeAlreadyExists:
                return "The Robin Nest code you entered already exists. Please choose a different one."
            case .robinNestNotFound:
                return "The Robin Nest with the provided code was not found."
            case .userAlreadyInRobinNest:
                return "This user is already a member of a Robin Nest."
            }
        }
    }
}
