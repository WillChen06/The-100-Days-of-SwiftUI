//
//  OnChangedDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/23.
//

import SwiftUI

struct OnChangedDemo: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { newValue in
                    print("New value is \(newValue)")
                }
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

struct OnChangedDemo_Previews: PreviewProvider {
    static var previews: some View {
        OnChangedDemo()
    }
}
