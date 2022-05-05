//
//  AddActivityView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/5.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var describtion: String = ""
    
    @ObservedObject var activities: Activities
    
    var body: some View {
        HStack {
            NavigationView {
                Form {
                    TextField("Title", text: $title)
                    Section("Describtion") {
                        TextEditor(text: $describtion)
                            .frame(height: 300)
                    }
                    
                }
                    .navigationTitle("New Activity")
                    .toolbar {
                        Button("Save") {
                            saveActivty()
                        }
                    }
            }
        }
    }
    
    func saveActivty() {
        let activity = Activity(title: title, describtion: describtion)
        activities.items.append(activity)
        dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
