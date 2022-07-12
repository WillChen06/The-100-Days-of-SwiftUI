//
//  PersonDetailView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/12.
//

import SwiftUI

struct PersonDetailView: View {
    let person: Person
    
    var body: some View {
        VStack {
            ImageHelper().getImage(path: person.imagePath)
                .resizable()
                .scaledToFit()
            Text(person.name)
                .font(.title2.bold())
        }
        .padding(.horizontal)
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person(name: "Testing", imagePath: ""))
    }
}
