//
//  UserDetailView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/19.
//

import SwiftUI

struct UserDetailView: View {
    var user: CachedUser
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Color(user.isActive ? .green : .red)
                            .clipShape(Circle())
                            .frame(width: 16, height: 16)
                        Text("\(user.wrappedName)(\(user.age))")
                            .font(.largeTitle)
                    }
                    Text(user.wrappedEmail)
                        .font(.headline)
                    Text(user.wrappedEmail)
                    Divider()
                        .padding([.leading, .trailing])
                    Text(user.wrappedAbout)
                        .padding()
                    
                    DisclosureGroup("Tags") {
                        ForEach(user.tagArray, id: \.self) { tag in
                            Text(tag)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    DisclosureGroup("Friends") {
                        ForEach(user.friendArray, id: \.id) { friend in
                            Text(friend.wrappedName)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    Spacer()
                    
                    Text(user.wrappedRegistered.formatted(date: .abbreviated, time: .standard))
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding([.bottom, .trailing])
                }
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height)
            }
        }
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(user: User.example)
//    }
//}
