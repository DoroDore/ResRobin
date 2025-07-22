//
//  ToolbarView.swift
//  RestaurantRecommend
//
//  Created by Theodore Zhu on 6/23/25.
//

import SwiftUI

struct ToolbarView: View {
    // A binding to the currently selected view type.
    // This allows the parent view to control which tab is active.
    @Binding var selectedView: ViewType

    var body: some View {
        HStack {
            // Stats Button
            Button(action: {
                selectedView = .stats // Update the binding to show StatsView
            }) {
                VStack {
                    Image("IconStats") // Use SF Symbol
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .foregroundColor(selectedView == .stats ? .accentColor : .gray) // Highlight if selected
            }
            
            Spacer()
            
            // Home Button (Main Menu)
            Button(action: {
                selectedView = .home // Update the binding to show HomeView
            }) {
                VStack {
                    Image("IconMainMenu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .foregroundColor(selectedView == .home ? .accentColor : .gray) // Highlight if selected
            }
            
            Spacer()
            
            // Profile Button
            Button(action: {
                selectedView = .profile // Update the binding to show ProfileView
            }) {
                VStack {
                    Image("IconProfile") // Use SF Symbol
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .foregroundColor(selectedView == .profile ? .accentColor : .gray) // Highlight if selected
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 30)
        .padding(.horizontal, 16)
        .background(.thinMaterial)
        // Apply the custom shape to clip the background
        .clipShape(TopRoundedRectangle(cornerRadius: 20)) // Adjust cornerRadius as desired
        .shadow(radius: 5)
    }
}

#Preview {
    // Provide a constant binding for the preview
    @Previewable @State var previewSelectedView: ViewType = .home
    return ToolbarView(selectedView: $previewSelectedView)
}
