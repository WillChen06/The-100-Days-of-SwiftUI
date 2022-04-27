//
//  CodableView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct CodableView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
   
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct CodableView_Previews: PreviewProvider {
    static var previews: some View {
        CodableView()
    }
}
