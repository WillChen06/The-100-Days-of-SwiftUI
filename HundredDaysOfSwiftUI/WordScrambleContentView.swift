//
//  WordScrambleContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/20.
//

import SwiftUI

struct WordScrambleContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Ray"]
    
    var body: some View {
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
        .listStyle(.grouped)
    }
    
    func test() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct WordScrambleContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleContentView()
    }
}
