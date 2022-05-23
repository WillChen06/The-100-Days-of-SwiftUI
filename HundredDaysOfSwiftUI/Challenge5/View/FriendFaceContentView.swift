//
//  FriendFaceContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/19.
//

import SwiftUI

struct FriendFaceContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.age),
        SortDescriptor(\.name)
    ]) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    HStack {
                        Color(user.isActive ? .green : .red)
                            .clipShape(Circle())
                            .frame(width: 16, height: 16)
                        Text(user.wrappedName)
                    }
                    
                }
            }
            .navigationTitle("Friend")
        }
        .onAppear {
            if users.isEmpty {
                Task { @MainActor in
                    await loadFriendFace()
                }
            }
        }
    }
    
    func loadFriendFace() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decoded = try decoder.decode([User].self, from: data)
            print("Get decoded data: \(decoded.count)")
            save(users: decoded)
        } catch {
            print("Download json file error : \(error.localizedDescription)")
        }
    }
    
    func save(users: [User]) {
        for user in users {
            let cachedUser = CachedUser(context: moc)
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            cachedUser.tags = user.tags.joined(separator: ",")
            
            var result: [CachedFriend] = []
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedFriend.origin = cachedUser
                result.append(cachedFriend)
            }
            cachedUser.friends = NSSet(array: result)
        }
        
        try? moc.save()
    }
}

struct FriendFaceContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendFaceContentView()
    }
}
