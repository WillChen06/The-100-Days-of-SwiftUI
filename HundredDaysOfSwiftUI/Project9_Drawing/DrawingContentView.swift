//
//  DrawingContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/3.
//

import SwiftUI

struct DrawingContentView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct DrawingContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingContentView()
            .preferredColorScheme(.dark)
    }
}
