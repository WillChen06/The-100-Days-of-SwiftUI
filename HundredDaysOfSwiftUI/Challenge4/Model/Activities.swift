//
//  Activities.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/5.
//

import Foundation

class Activities: ObservableObject {
    @Published var items: [Activity] = [] {
        didSet {
            if let encode = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encode, forKey: String(describing: type(of: self)))
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: String(describing: type(of: self))) {
            if let activities = try? JSONDecoder().decode([Activity].self, from: data) {
                self.items = activities
                return
            }
        }
        items = []
    }
}
