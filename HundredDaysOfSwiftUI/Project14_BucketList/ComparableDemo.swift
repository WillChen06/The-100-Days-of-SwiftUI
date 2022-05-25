//
//  ComparableDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/25.
//

import SwiftUI

struct ComparableUser: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: ComparableUser, rhs: ComparableUser) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableDemo: View {
    let users = [
        ComparableUser(firstName: "Arnoid", lastName: "Rimmer"),
        ComparableUser(firstName: "Kristine", lastName: "Kochanski"),
        ComparableUser(firstName: "David", lastName: "Lister")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ComparableDemo_Previews: PreviewProvider {
    static var previews: some View {
        ComparableDemo()
    }
}
