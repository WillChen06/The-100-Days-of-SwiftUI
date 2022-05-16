//
//  Project12DataController.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/16.
//

import CoreData
import Foundation

class Project12DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
