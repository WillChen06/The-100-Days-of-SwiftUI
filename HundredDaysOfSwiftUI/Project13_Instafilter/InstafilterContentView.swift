//
//  InstafilterContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/23.
//

import SwiftUI

struct InstafilterContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImgaePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImgaePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else { return }

                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImgaePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct InstafilterContentView_Previews: PreviewProvider {
    static var previews: some View {
        InstafilterContentView()
    }
}
