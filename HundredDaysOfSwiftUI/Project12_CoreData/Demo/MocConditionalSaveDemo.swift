//
//  MocConditionalSaveDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/16.
//

import SwiftUI

struct MocConditionalSaveDemo: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct MocConditionalSaveDemo_Previews: PreviewProvider {
    static var previews: some View {
        MocConditionalSaveDemo()
    }
}
