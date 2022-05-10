//
//  DisabledDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/10.
//

import SwiftUI

struct DisabledDemo: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct DisabledDemo_Previews: PreviewProvider {
    static var previews: some View {
        DisabledDemo()
    }
}
