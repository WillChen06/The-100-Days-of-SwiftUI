//
//  MergePolicyDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/17.
//

import SwiftUI

struct MergePolicyDemo: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MergePolicyDemo_Previews: PreviewProvider {
    static var previews: some View {
        MergePolicyDemo()
    }
}
