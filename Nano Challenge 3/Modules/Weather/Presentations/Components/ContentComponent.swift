//
//  ContentComponent.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 15/07/24.
//

import SwiftUI

struct ContentComponent: View {
    var contentModel: ContentModel
    @Binding var selectedDate: Date
    @ObservedObject var weatherManager: WeatherManager

    var body: some View {
        let temperature = weatherManager.curWeather?.temperature.converted(to: .celsius).value
        let uvIndex = weatherManager.curWeather?.uvIndex.value
        let precipitationChance = weatherManager.curWeather?.precipitationChance

        VStack {
            Spacer()
            if let temperature = temperature, temperature > 20 {
                Text(contentModel.status)
                    .foregroundStyle(.gray)
                Text("\(temperature, specifier: "%.1f")°C")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            } else {
                Text("--")
            }

            Image(contentModel.imageName)
            Text(contentModel.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text(contentModel.detail)
                .font(.title3)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

#Preview {
    @State var weatherManager = WeatherManager()
    @State var selectedDate = Date()
    return ContentComponent(contentModel: ContentModel.dummy, selectedDate: $selectedDate, weatherManager: weatherManager)
}
