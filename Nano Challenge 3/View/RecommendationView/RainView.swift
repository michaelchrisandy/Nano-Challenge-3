//
//  RainView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct RainView: View {
    @StateObject private var weatherManager = WeatherManager()

    var body: some View {
        VStack {
            Text("Rainy")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("hot")
            Text("It's rainy outside")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Play inside so you won't get caught in the rain")
                .font(.title3)
                .multilineTextAlignment(.center)
        }         
    }
}

#Preview {
    RainView()
}
