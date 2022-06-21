//
//  AccessibilityContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/6/21.
//

import SwiftUI
/**
 Hidden and grouping accessbility data
     Image(decorative: "character")
         .accessibilityHidden(true)
     VStack {
         Text("Your score is")
         Text("1000")
             .font(.title)
     }
     .accessibilityElement(children: .combine)
 */

struct AccessibilityContentView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled")
            }
        }
    }
}

struct AccessibilityContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityContentView()
    }
}
