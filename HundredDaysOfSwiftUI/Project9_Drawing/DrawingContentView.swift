//
//  DrawingContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/3.
//

import SwiftUI

struct DrawingContentView: View {
    var body: some View {
        Challenge_ColorCyclingRectangle()
    }
}

struct DrawingContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingContentView()
            .preferredColorScheme(.dark)
    }
}
