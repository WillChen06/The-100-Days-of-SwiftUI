//
//  Challenge_AnimatableArrow.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/4.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - (rect.maxX / 3), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - (rect.maxX / 3), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        path.closeSubpath()
        return path
    }
}

struct Challenge_AnimatableArrow: View {
    @State private var thickness: CGFloat = 10.0
    @State private var isBig = false
    
    var body: some View {
        Arrow()
            .stroke(Color.blue, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isBig.toggle()
                    self.thickness = self.isBig ? 30.0 : 10.0
                }
            }
    }
}

struct Challenge_AnimatableArrow_Previews: PreviewProvider {
    static var previews: some View {
        Challenge_AnimatableArrow()
            .preferredColorScheme(.dark)
    }
}
