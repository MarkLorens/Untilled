//
//  MoundShape.swift
//  Untilled
//
//  Created by Max on 19/04/26.
//

import SwiftUI

struct MoundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start bottom-left
        path.move(to: CGPoint(x: 0, y: rect.height))
        
        // Left edge up
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.12))
        
        // Curve across the top
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: rect.height * 0.12),
            control: CGPoint(x: rect.width / 2, y: 0)
        )
        
        // Right edge down
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        
        // Close shape
        path.closeSubpath()

        return path
    }
}

#Preview{
    MoundShape()
}
