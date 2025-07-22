//
//  StatsView.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Image(systemName: "chart.pie.fill") // SF Symbol for charts
                .imageScale(.large)
                .font(.system(size: 60))
                .foregroundStyle(.blue)
            Text("Your Application Statistics")
                .font(.title)
                .padding(.top, 10)
            Text("Data and insights will be displayed here.")
                .font(.body)
                .foregroundColor(.gray)
        }
        .navigationTitle("Stats") // Set navigation title for this view
    }
}

#Preview {
    StatsView()
}
