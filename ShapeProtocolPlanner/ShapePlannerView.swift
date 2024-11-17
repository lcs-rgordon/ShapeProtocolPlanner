//
//  ShapePlannerView.swift
//  ShapeProtocolPlanner
//
//  Created by Russell Gordon on 2024-11-17.
//

import SwiftUI

struct ShapePlanner: Shape {
    
    let withOutline: Bool
    let withVerticalQuarters: Bool
    let withHorizontalQuarters: Bool
    
    // Initializer
    init(
        withOutline: Bool = true,
        withVerticalQuarters: Bool = false,
        withHorizontalQuarters: Bool = false
    ) {
        self.withOutline = withOutline
        self.withVerticalQuarters = withVerticalQuarters
        self.withHorizontalQuarters = withHorizontalQuarters
    }
    
    // Functions
    func path(in rect: CGRect) -> Path {
        
        // Create an empty path
        var path = Path()
        
        // Draw outline
        if withOutline {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
        
        // Draw horizontal dividers
        if withHorizontalQuarters {
            // 1/4
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
            
            // 2/4 or 1/2
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY / 4 * 2))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4 * 2))
            
            // 3/4
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY / 4 * 3))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4 * 3))
            
        }
        
        // Draw vertical dividers
        if withVerticalQuarters {

            // 1/4
            path.move(to: CGPoint(x: rect.maxX / 4 * 1, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX / 4 * 1, y: rect.maxY))
            
            // 2/4 or 1/2
            path.move(to: CGPoint(x: rect.maxX / 4 * 2, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX / 4 * 2, y: rect.maxY))
            
            // 3/4
            path.move(to: CGPoint(x: rect.maxX / 4 * 3, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX / 4 * 3, y: rect.maxY))

        }
        
        
        return path
    }
}

struct ShapePlannerView: View {
    var body: some View {
        ZStack {
            
            // Background layer
            ZStack {

                ShapePlanner(
                    withOutline: true
                )
                .fill(.yellow.opacity(0.1))
                .stroke(
                    .black,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                
                ShapePlanner(
                    withOutline: false,
                    withHorizontalQuarters: true
                )
                .stroke(
                    .black,
                    style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round,
                        lineJoin: .round,
                        dash: [10.0]
                    )
                )

                ShapePlanner(
                    withOutline: false,
                    withVerticalQuarters: true,
                    withHorizontalQuarters: false
                )
                .stroke(
                    .black,
                    style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round,
                        lineJoin: .round,
                        dash: [10.0]
                    )
                )

                
            }
            .padding(.top, 100)
            .padding(.leading, 150)
            .padding(.trailing, 50)

            // Middle layer
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("rect.minX")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                                
                    Spacer()

                    Text("rect.midX")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                                
                    Spacer()

                    Text("rect.maxX")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                        }
                
                Spacer()
            }
            .padding(.leading, 150)
            .padding(.trailing, 50)
            .padding(.vertical, 25)

            // Top layer
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("rect.minY")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                                
                    Spacer()

                    Text("rect.midY")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                                
                    Spacer()

                    Text("rect.maxY")
                        .font(.system(size: 24.0, weight: .light, design: .serif))
                        .italic()
                        }
                
                Spacer()
            }
            .padding(.leading, 25)
            .padding(.top, 100)

        }

    }
}

struct PlanView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ShapePlannerView()
                    .aspectRatio(1.0/1.0, contentMode: .fit)
                    .frame(height: 750.0)
                
                Text("Make a plan")
                    .font(.title)
                    .bold()
                    .padding(.top)

                Text("How many vertices would you need? At what locations?")
                    .font(.body)
                    .italic()

                Spacer()
            }
            .navigationTitle("Diamond")
        }
    }
}

#Preview {
    PlanView()
}
