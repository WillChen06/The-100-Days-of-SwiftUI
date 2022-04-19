//
//  BetterRestContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/19.
//

import SwiftUI

struct BetterRestContentView: View {
    
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .omitted))
    }
}

struct BetterRestContentView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestContentView()
    }
}
