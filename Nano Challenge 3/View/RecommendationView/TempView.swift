//
//  TempView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct TempView: View {
    @StateObject private var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            Text(weatherManager.temperature)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("hot")
            Text("It's hot outside")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Play inside so you don't melt")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
        .onAppear {
            Task {
                await weatherManager.getWeather(lat: -6.291096092322379, long: 106.61980068174248) // BSD latitude and longitude
            }
        }
    }
}

#Preview {
    TempView()
}
