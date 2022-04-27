//
//  ScrollingGridView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct ScrollingGridView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGridView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGridView()
    }
}
