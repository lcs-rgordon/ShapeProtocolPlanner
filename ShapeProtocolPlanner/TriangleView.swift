//
//  ContentView.swift
//  ShapeProtocolPlanner
//
//  Created by Russell Gordon on 2024-11-17.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct TriangleView: View {
    var body: some View {
        Triangle()
            .fill(.red)
            .frame(width: 100, height: 200)
            .border(.green)
    }
}

#Preview {
    TriangleView()
}
