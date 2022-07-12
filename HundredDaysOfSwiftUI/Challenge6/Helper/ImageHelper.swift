//
//  ImageHelper.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/11.
//

import Foundation
import SwiftUI

struct ImageHelper {
    func setImage(image: Data) -> String? {
        let url = getDocumentDirectory().appendingPathComponent(UUID().uuidString)
        
        do {
            try image.write(to: url, options: [.atomicWrite, .completeFileProtection])
            return url.lastPathComponent
        } catch {
            print("Could not write image: " + error.localizedDescription)
        }
        
        return nil
    }
    
    func getImage(path: String?) -> Image {
        guard let imagePath = path else {
            return Image(systemName: "person.crop.square")
        }
        
        let url = getDocumentDirectory().appendingPathComponent(imagePath)
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return Image(uiImage: image)
            }
        }
        
        return Image(systemName: "person.crop.square")
    }
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
