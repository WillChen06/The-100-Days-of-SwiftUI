//
//  FilteredList.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicateWay: PredicateWay, sorts: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sorts, predicate: NSPredicate(format: "%K \(predicateWay.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
