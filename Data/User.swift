//
//  User.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//


//
//  User.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import Foundation
import FirebaseFirestore // Required for @DocumentID and Codable extensions

// Represents a user document in Firestore.
// Conforms to Codable for easy serialization/deserialization to/from Firestore.
// Conforms to Identifiable for use in SwiftUI lists/views.
struct User: Codable, Identifiable {
    // @DocumentID maps the Firestore document ID to this property.
    // It's optional because it might not be set when creating a new user locally.
    @DocumentID var id: String? // Firebase User UID will typically be the document ID

    let email: String
    var groupId: String? // ID of the group the user belongs to. Optional until they join/create one.

    // Initializer for creating a new User object.
    // The 'id' (DocumentID) is often set by Firestore upon creation.
    init(id: String? = nil, email: String, groupId: String? = nil) {
        self.id = id
        self.email = email
        self.groupId = groupId
    }
}
