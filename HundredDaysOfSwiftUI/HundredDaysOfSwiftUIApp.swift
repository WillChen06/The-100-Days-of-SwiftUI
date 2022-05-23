//
//  HundredDaysOfSwiftUIApp.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/3/29.
//

import SwiftUI

@main
struct HundredDaysOfSwiftUIApp: App {
    @StateObject private var dataController = FriendFaceDataController()
    
    var body: some Scene {
        WindowGroup {
            FriendFaceContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
