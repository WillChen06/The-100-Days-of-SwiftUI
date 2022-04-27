//
//  Expenses.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: String(describing: type(of: self)))
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: String(describing: type(of: self))) {
            if let decodeItems = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems) {
                items = decodeItems
                return
            }
        }
        items = []
    }
}

class BussinessExpenses: Expenses {
    
}

class PersonalExpenses: Expenses {
    
}
