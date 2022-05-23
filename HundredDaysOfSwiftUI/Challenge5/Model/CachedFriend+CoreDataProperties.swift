//
//  CachedFriend+CoreDataProperties.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/20.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
}

extension CachedFriend : Identifiable {

}
