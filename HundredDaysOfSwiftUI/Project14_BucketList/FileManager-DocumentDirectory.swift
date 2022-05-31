//
//  FileManager-DocumentDirectory.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/31.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
