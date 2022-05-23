//
//  InstafilterContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/23.
//

import SwiftUI

struct InstafilterContentView: View {
    @State private var image: Image?
    @State private var showingImgaePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImgaePicker = true
            }
            .sheet(isPresented: $showingImgaePicker) {
                ImagePicker()
            }
        }
    }
}

struct InstafilterContentView_Previews: PreviewProvider {
    static var previews: some View {
        InstafilterContentView()
    }
}
