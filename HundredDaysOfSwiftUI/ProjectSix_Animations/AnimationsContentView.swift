//
//  AnimationsContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/21.
//

import SwiftUI

struct AnimationsContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct AnimationsContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsContentView()
    }
}
