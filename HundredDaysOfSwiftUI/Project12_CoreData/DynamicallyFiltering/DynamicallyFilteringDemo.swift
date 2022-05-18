//
//  DynamicallyFilteringDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//

import CoreData
import SwiftUI

struct DynamicallyFilteringDemo: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, predicateWay: .beginsWith, sorts: [
                NSSortDescriptor(keyPath: \Singer.lastName, ascending: true),
                NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)
            ]) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Talyor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct DynamicallyFilteringDemo_Previews: PreviewProvider {
    static var previews: some View {
        DynamicallyFilteringDemo()
    }
}
