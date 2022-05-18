//
//  PredicateWay.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/18.
//

import Foundation

enum PredicateWay: String {
    case beginsWith = "BEGINSWITH"
    case beginsWithInsensitive = "BEGINSWITH[c]"
    case equal = "=="
    case lessThan = "<"
    case largeThan = ">"
    case inValue = "IN"
}
