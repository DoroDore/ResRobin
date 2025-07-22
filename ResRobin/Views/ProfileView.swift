//
//  ProfileView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//


//
//  ProfileView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill") // SF Symbol for profile
                .imageScale(.large)
                .font(.system(size: 60))
                .foregroundStyle(.green)
            Text("User Profile")
                .font(.title)
                .padding(.top, 10)
            Text("Manage your personal information and settings.")
                .font(.body)
                .foregroundColor(.gray)
        }
        .navigationTitle("Profile") // Set navigation title for this view
    }
}

#Preview {
    ProfileView()
}
