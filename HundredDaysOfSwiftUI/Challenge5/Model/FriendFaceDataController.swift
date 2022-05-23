//
//  FriendFaceDataController.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/20.
//

import CoreData
import Foundation

class FriendFaceDataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFace")
    
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
