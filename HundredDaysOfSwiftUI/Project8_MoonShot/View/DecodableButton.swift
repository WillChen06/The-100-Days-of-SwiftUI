//
//  DecodableButton.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct UserInfo: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct DecodableButton: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(UserInfo.self, from: data) {
                print("Decoded user : \(user)")
            }
        }
    }
}

struct DecodableButton_Previews: PreviewProvider {
    static var previews: some View {
        DecodableButton()
    }
}
