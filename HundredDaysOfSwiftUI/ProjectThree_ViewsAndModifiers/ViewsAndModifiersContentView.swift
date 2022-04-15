//
//  ViewsAndModifiersContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/14.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
            
        }
    }
}

struct ViewsAndModifiersContentView: View {
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct ViewsAndModifiersContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAndModifiersContentView()
    }
}
