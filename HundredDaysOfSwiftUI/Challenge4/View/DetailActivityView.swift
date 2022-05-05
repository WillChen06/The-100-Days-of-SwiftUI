//
//  DetailActivityView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/5.
//

import SwiftUI

struct DetailActivityView: View {

    var activity: Activity
    var body: some View {
        ScrollView {
            VStack {
                Text(activity.title)
                    .font(.largeTitle)
                
                Divider()
                
                Text(activity.describtion)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding([.top])
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct DetailActivityView_Previews: PreviewProvider {
    static var previews: some View {
        DetailActivityView(activity: Activity.temp)
    }
}
