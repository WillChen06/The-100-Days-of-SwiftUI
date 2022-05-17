//
//  Candy+CoreDataProperties.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown candy"
    }
}

extension Candy : Identifiable {

}
