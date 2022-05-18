//
//  HashableDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/16.
//

import SwiftUI

struct HashableStudent: Hashable {
    let name: String
}

struct HashableDemo: View {
    let students = [HashableStudent(name: "Harry Potter"), HashableStudent(name: "Hermione Granger")]
    
    var body: some View {
        List {
            ForEach(students, id: \.self) { student in
                Text(student.name)
            }
        }
    }
}

struct HashableDemo_Previews: PreviewProvider {
    static var previews: some View {
        HashableDemo()
    }
}
