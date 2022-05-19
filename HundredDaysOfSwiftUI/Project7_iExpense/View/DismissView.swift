//
//  DismissView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import SwiftUI

// @StateObject
//class IExpenseUser: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct DismissView: View {
    @State private var isShowing = false
    
    var body: some View {
        Button("Show") {
            isShowing.toggle()
        }
        .sheet(isPresented: $isShowing) {
            SecondView(name: "Testing")
        }
    }
}

struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}
