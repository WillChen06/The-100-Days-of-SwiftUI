//
//  GuessTheFlagContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/13.
//

import SwiftUI

struct GuessTheFlagContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
        }
    }
}

struct GuessTheFlagContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagContentView()
    }
}
