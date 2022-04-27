//
//  NavigationLinkDemoView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct NavigationLinkDemoView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}

struct NavigationLinkDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkDemoView()
    }
}
