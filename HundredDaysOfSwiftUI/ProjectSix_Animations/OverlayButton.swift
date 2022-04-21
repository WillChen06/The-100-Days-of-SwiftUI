//
//  OverlayButton.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/21.
//

import SwiftUI

struct OverlayButton: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") { }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 2).repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct OverlayButton_Previews: PreviewProvider {
    static var previews: some View {
        OverlayButton()
    }
}
