//
//  GifHelper.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 16/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct GifImageView: View {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    var body: some View {
        if let url = Bundle.main.url(forResource: name, withExtension: "gif") {
            AnimatedImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Text("GIF not found")
        }
    }
}
