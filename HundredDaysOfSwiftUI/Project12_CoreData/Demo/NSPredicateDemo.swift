//
//  NSPredicateDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//

import SwiftUI
import CoreData

struct NSPredicateDemo: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
        }
        
        Button("Add Examples") {
            let ship1 = Ship(context: moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: moc)
            ship3.name = "Millennium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            try? moc.save()
        }
    }
}

struct NSPredicateDemo_Previews: PreviewProvider {
    static var previews: some View {
        NSPredicateDemo()
    }
}
