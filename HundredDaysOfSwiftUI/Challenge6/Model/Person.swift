//
//  Person.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/11.
//

import Foundation

struct Person: Codable, Identifiable {
    var id = UUID()
    var name: String
    var imagePath: String
}
