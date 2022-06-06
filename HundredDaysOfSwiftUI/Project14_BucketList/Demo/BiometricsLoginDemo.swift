//
//  BiometricsLoginDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/27.
//

import LocalAuthentication
import SwiftUI

struct BiometricsLoginDemo: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
}

struct BiometricsLoginDemo_Previews: PreviewProvider {
    static var previews: some View {
        BiometricsLoginDemo()
    }
}
