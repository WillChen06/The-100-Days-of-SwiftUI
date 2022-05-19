//
//  UserDetailView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/19.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Color(user.isActive ? .green : .red)
                            .clipShape(Circle())
                            .frame(width: 16, height: 16)
                        Text("\(user.name)(\(user.age))")
                            .font(.largeTitle)
                    }
                    Text(user.email)
                        .font(.headline)
                    Text(user.company)
                    Divider()
                        .padding([.leading, .trailing])
                    Text(user.about)
                        .padding()
                    
                    DisclosureGroup("Tags") {
                        ForEach(user.tags, id: \.self) { tag in
                            Text(tag)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    DisclosureGroup("Friends") {
                        ForEach(user.friends, id: \.id) { friend in
                            Text(friend.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    Spacer()
                    
                    Text(user.registered.formatted(date: .abbreviated, time: .standard))
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding([.bottom, .trailing])
                }
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height)
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User.example)
    }
}
