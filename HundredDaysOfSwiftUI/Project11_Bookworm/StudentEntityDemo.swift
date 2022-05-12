//
//  StudentEntityDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/12.
//

import SwiftUI

struct StudentEntityDemo: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName  = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"

                try? moc.save()
            }
        }
    }
}

struct StudentEntityDemo_Previews: PreviewProvider {
    static var previews: some View {
        StudentEntityDemo()
    }
}
