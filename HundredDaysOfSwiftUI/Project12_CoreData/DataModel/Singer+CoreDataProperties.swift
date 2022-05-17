//
//  Singer+CoreDataProperties.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        firstName ?? "Unknown"
    }
}

extension Singer : Identifiable {

}
