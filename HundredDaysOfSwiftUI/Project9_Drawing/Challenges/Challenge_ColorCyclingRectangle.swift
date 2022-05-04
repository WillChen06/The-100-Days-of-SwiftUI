//
//  Challenge_ColorCyclingRectangle.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/4.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var startX = 0.5
    var startY = 0.0
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [color(for: value, brightness: 1), color(for: value, brightness: 0.5)]), startPoint: UnitPoint(x: startX, y: startY), endPoint: .bottom)
                        ,
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct Challenge_ColorCyclingRectangle: View {
    @State private var startX = 0.5
    @State private var startY = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(startX: startX, startY: startY)
                .frame(width: 300, height: 300)
            
            VStack(alignment: .leading) {
                Text("X")
                Slider(value: $startX)
            }
            .padding([.horizontal, .bottom])
            
            VStack(alignment: .leading) {
                Text("Y")
                Slider(value: $startY)
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct Challenge_ColorCyclingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        Challenge_ColorCyclingRectangle()
    }
}
