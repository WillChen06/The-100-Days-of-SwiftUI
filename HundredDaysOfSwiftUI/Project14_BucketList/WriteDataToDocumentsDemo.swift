//
//  WriteDataToDocumentsDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/25.
//

import SwiftUI

struct WriteDataToDocumentsDemo: View {
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct WriteDataToDocumentsDemo_Previews: PreviewProvider {
    static var previews: some View {
        WriteDataToDocumentsDemo()
    }
}
