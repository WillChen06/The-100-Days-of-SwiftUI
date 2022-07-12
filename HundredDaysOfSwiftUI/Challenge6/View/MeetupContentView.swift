//
//  MeetupContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/11.
//

import SwiftUI

struct MeetupContentView: View {
    @StateObject var people = People()
    
    @State private var showingAddView = false
    
    let columns = [
        GridItem(.flexible(minimum: 150), spacing: 8),
        GridItem(.flexible(minimum: 150), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(people.data, id: \.id) { person in
                        NavigationLink {
                            PersonDetailView(person: person)
                        } label: {
                            PersonGridView(person: person)
                        }
                    }
                }
            }
            .navigationTitle("Meetup")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                MeetupAddView(people: people)
            }
        }
    }
}

struct MeetupContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetupContentView()
    }
}
