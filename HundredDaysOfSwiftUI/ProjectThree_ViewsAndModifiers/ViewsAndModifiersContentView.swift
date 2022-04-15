//
//  ViewsAndModifiersContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/14.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.cyan)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("Form for testing.")
                .titleStyle()
                .padding(30)
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
            Spacer()
            Spacer()
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
