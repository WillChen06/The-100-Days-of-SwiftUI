//
//  ConfirmationDialogDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/23.
//

import SwiftUI

struct ConfirmationDialogDemo: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) {  }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ConfirmationDialogDemo_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogDemo()
    }
}
