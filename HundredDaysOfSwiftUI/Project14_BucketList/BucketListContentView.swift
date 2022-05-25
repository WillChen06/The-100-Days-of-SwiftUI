//
//  BucketListContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/25.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed")
    }
}

struct BucketListContentView: View {
    let loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
    
    
}

struct BucketListContentView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListContentView()
    }
}
