//
//  PersonGridView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/12.
//

import SwiftUI

struct PersonGridView: View {
    let person: Person
    
    var body: some View {
        VStack {
            ImageHelper().getImage(path: person.imagePath)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            Text(person.name)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .font(.title2)
                .foregroundColor(.white)
                .background(.lightBackground)
                
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
    }
}
