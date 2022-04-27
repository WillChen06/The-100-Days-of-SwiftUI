//
//  MoonshotContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct MoonshotContentView: View {
    var body: some View {
        ScrollingGridView()
    }
}

struct MoonshotContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoonshotContentView().preferredColorScheme(.dark)
    }
}
