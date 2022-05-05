//
//  HabitTrackingContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/5.
//

import SwiftUI

struct HabitTrackingContentView: View {
    @StateObject var activities = Activities()
    @State private var isPresentingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        DetailActivityView(activity: activity)
                    } label: {
                        Text(activity.title)
                            .font(.headline)
                    }
                    
                }.onDelete(perform: deleteItem)
            }
            .navigationTitle("Habbit Tracking")
            .toolbar {
                Button {
                    isPresentingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingAddView) {
                AddActivityView(activities: activities)
            }
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        activities.items.remove(atOffsets: indexSet)
    }
}

struct HabitTrackingContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTrackingContentView()
    }
}
