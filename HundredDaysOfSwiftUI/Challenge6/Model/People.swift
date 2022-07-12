//
//  People.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/11.
//

import Foundation

class People: ObservableObject {
    @Published var data = [Person]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(data) {
                UserDefaults.standard.set(encoded, forKey: String(describing: type(of: self)))
            }
        }
    }
    
    init() {
        if let saveData = UserDefaults.standard.data(forKey: String(describing: type(of: self))) {
            if let decodeData = try? JSONDecoder().decode([Person].self, from: saveData) {
                data = decodeData
                return
            }
        }
        data = []
    }
}
