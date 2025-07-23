//
//  Group.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import Foundation
import FirebaseFirestore // Required for @DocumentID and Codable extensions

// Represents a group document in Firestore.
// Conforms to Codable for easy serialization/deserialization to/from Firestore.
// Conforms to Identifiable for use in SwiftUI lists/views.
struct RobinNest: Codable, Identifiable {
    // @DocumentID maps the Firestore document ID to this property.
    // For groups, this will be the unique "code" the user enters.
    @DocumentID var id: String? // This will be the unique "code" (e.g., "MyHappyFamily")

    let name: String // The display name of the group
    let code: String // The unique code for joining/identifying the group
    let adminUserId: String // The UID of the user who created this group
    var members: [String] // Array of user UIDs belonging to this group
    var imageUrl: URL? // Optional URL for a group image (we'll implement image upload later)

    // Initializer for creating a new Group object.
    // The 'id' is explicitly set to 'code' for uniqueness.
    init(id: String? = nil, name: String, code: String, adminUserId: String, members: [String], imageUrl: URL? = nil) {
        self.id = id ?? code // If id is not provided, use the code as the document ID
        self.name = name
        self.code = code
        self.adminUserId = adminUserId
        self.members = members
        self.imageUrl = imageUrl
    }
}
