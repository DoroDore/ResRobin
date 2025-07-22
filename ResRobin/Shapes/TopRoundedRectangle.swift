//
//  TopRoundedRectangle.swift
//  ResRobin
//
//  Created by Theodore Zhu on 7/22/25.
//

import SwiftUI

struct TopRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from bottom-left
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Line to top-left corner start
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        
        // Top-left arc
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        
        // Line to top-right corner start
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        
        // Top-right arc
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)
        
        // Line to bottom-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Close the path by connecting to the starting point (bottom-left)
        path.closeSubpath()
        
        return path
    }
}
