//
//  AppStorageView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
