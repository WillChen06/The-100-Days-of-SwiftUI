//
//  AsyncImageDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/9.
//

import SwiftUI

struct AsyncImageDemo: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct AsyncImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageDemo()
    }
}
