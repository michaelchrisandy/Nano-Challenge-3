//
//  ContentComponent.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 15/07/24.
//

import SwiftUI

struct ContentComponent: View {
    var contentModel: ContentModel
    var selectedSegment: Int
    @Binding var selectedDate: Date
    @ObservedObject var weatherManager: WeatherManager
    @StateObject private var airPollutionModel = AQIViewModel()

    var body: some View {
        let temperature = weatherManager.curWeather?.temperature.converted(to: .celsius).value
        let uvIndex = weatherManager.curWeather?.uvIndex.value
        let precipitationChance = weatherManager.curWeather?.precipitationChance
        let airPollutionIndex: Int? = airPollutionModel.aqi

        VStack {
            Spacer()
            
            switch selectedSegment {
            // temp rain aqi uv D
            case 0:
                if let temperature = temperature {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                    Text("\(temperature, specifier: "%.1f")°C")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                } else {
                    Text("--")
                }
            case 1:
                if let precipitationChance = precipitationChance {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                    Text("\(precipitationChance * 100, specifier: "%.1f") %")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                } else {
                    Text("--")
                }
            case 2:
                if let airPollutionIndex = airPollutionIndex {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                    Text("\(airPollutionIndex) AQI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                } else {
                    Text("--")
                }
            case 3:
                if let uvIndex = uvIndex {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
//                    Text("\(uvIndex) index")
                    Text("\(uvIndex, specifier: "%d") index")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                } else {
                    Text("--")
                }
            case 4:
                if Calendar.current.component(.hour, from: selectedDate) >= 8 && Calendar.current.component(.hour, from: selectedDate) <= 16 {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                    Text("Good time for Vitamin D")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                } else {
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                    Text("Not Ideal time for Vitamin D")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
            default:
                Text(contentModel.status)
                    .foregroundStyle(.gray)
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
        .padding()
        .onAppear {
            airPollutionModel.fetchAQI()
        }
    }
}

#Preview {
    @State var weatherManager = WeatherManager()
    @State var selectedDate = Date()
    return ContentComponent(contentModel: ContentModel.dummy, selectedSegment: 0, selectedDate: $selectedDate, weatherManager: weatherManager)
}
