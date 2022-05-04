//
//  ImagePaintDemo.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/3.
//

import SwiftUI

struct ImagePaintDemo: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), lineWidth: 50)
            .frame(width: 300, height: 200)
    }
}


struct ImagePaintDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintDemo()
    }
}
