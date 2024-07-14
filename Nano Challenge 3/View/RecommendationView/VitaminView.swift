//
//  VitaminView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct VitaminView: View {
    var body: some View {
        VStack {
            Text("10-4 PM")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("hot")
            Text("It's good to go outside")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Play outside because Vit D is a lot")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    VitaminView()
}
