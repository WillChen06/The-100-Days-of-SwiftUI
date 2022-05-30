//
//  URLSessionDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/9.
//

import SwiftUI

struct Response: Codable {
    var results: [ResultDemo]
}

struct ResultDemo: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct URLSessionDemo: View {
    @State private var results = [ResultDemo]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct URLSessionDemo_Previews: PreviewProvider {
    static var previews: some View {
        URLSessionDemo()
    }
}
