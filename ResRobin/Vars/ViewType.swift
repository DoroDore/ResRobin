//
//  ViewType.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import Foundation

// Defines the different views that can be selected from the toolbar.
// Conforms to Identifiable for use in ForEach or similar SwiftUI views,
// and CaseIterable to easily get all cases (if needed elsewhere).
enum ViewType: String, Identifiable, CaseIterable {
    case home = "Home"
    case stats = "Stats"
    case profile = "Profile"

    // Provides a unique ID for each case, useful for SwiftUI.
    var id: String { self.rawValue }

    // Returns the asset catalog image name for each view type.
    var iconName: String {
        switch self {
        case .home:
            return "IconMainMenu" // Your custom icon for Home
        case .stats:
            return "IconStats"    // Your custom icon for Stats
        case .profile:
            return "IconProfile"  // Your custom icon for Profile
        }
    }

    // Returns a descriptive title for each view type.
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .stats:
            return "Stats"
        case .profile:
            return "Profile"
        }
    }
}
