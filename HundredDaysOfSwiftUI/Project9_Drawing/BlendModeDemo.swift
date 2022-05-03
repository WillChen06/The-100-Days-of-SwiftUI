//
//  BlendModeDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/3.
//

import SwiftUI

struct CirclingColorBlendView: View {
    var amount: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 1, green: 0, blue: 0))
                .frame(width: 200 * amount)
                .offset(x: -50, y: -80)
                .blendMode(.screen)

            Circle()
                .fill(Color(red: 0, green: 1, blue: 0))
                .frame(width: 200 * amount)
                .offset(x: 50, y: -80)
                .blendMode(.screen)

            Circle()
                .fill(Color(red: 0, green: 0, blue: 1))
                .frame(width: 200 * amount)
                .blendMode(.screen)
        }
        .frame(width: 300, height: 300)
    }
}

struct BlurImageView: View {
    var amount: Double
    
    var body: some View {
        Image("Example")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(amount)
            .blur(radius: (1 - amount) * 20)
    }
}

struct BlendModeDemo: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            CirclingColorBlendView(amount: amount)
            
//            BlurImageView(amount: amount)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct BlendModeDemo_Previews: PreviewProvider {
    static var previews: some View {
        BlendModeDemo()
    }
}
