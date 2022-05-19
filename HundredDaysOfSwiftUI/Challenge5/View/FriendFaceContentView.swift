//
//  FriendFaceContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/19.
//

import SwiftUI

struct FriendFaceContentView: View {
    @State private var users: [User] = []
    
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
                        Text(user.name)
                    }
                    
                }
            }
            .navigationTitle("Friend")
        }
        .onAppear {
            if users.isEmpty {
                Task {
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
            users = decoded
        } catch {
            print("Download json file error : \(error.localizedDescription)")
        }
    }
}

struct FriendFaceContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendFaceContentView()
    }
}
