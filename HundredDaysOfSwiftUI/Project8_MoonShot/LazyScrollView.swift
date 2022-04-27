//
//  LazyScrollView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct LazyScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct LazyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LazyScrollView()
    }
}
