//
//  UVView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct UVView: View {
    var body: some View {
        VStack {
            Text("UV Index")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("hot")
            Text("It's hot outside")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Play inside so you don't get sunburn")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    UVView()
}
