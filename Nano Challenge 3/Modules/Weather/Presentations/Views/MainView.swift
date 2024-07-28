//
//  MainView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI
import UIKit
import SwiftData

struct MainView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State var segmentedSelection = 0
    @StateObject private var weatherManager = WeatherManager()
    @State private var selectedDate = Date()
    @StateObject private var airQualityModel = AQIViewModel()
    
   
    @Query var userInfo: [UserInfo]
    
    var body: some View {
        VStack {
            SearchView(selectedDate: $selectedDate,  weatherManager: weatherManager, airQualityModel: airQualityModel)

            if InputStatus.isLocationEmpty {
                InitialView()
            } else {
                Picker(selection: $segmentedSelection, label: Text("")) {
                    Text("Temp").tag(0)
                    Text("Rain").tag(1)
                    Text("AQI").tag(2)
                    Text("UV").tag(3)
                    Text("Vit D").tag(4)
                }
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: segmentedSelection) {
                    let temp = userInfo[0]
                    temp.lastSegmentSelected = segmentedSelection
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
                
                ContentComponent(contentModel: getContentModel(), selectedSegment: segmentedSelection, selectedDate: $selectedDate, weatherManager: weatherManager, airQualityModel: airQualityModel)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .background(.backgroundColoranjay)
        .onAppear{
//            segmentedSelection = userInfo[0].lastSegmentSelected
            if(userInfo.isEmpty){
                addUserInfo()
            }
            else{
                segmentedSelection = userInfo[0].lastSegmentSelected
            }
            
        }
    }

    private func getContentModel() -> ContentModel {
        switch segmentedSelection {
        case 0:
            return getTemperatureModel()
        case 1:
            return getRainModel()
        case 2:
            return getAirQualityModel()
        case 3:
            return getUVModel()
        case 4:
            return getVitaminDModel()
        default:
            return getTemperatureModel()
        }
    }

    private func getTemperatureModel() -> ContentModel {
        // Logic to determine Good, Moderate, Bad based on weather data
        let temperature = weatherManager.curWeather?.temperature.converted(to: .celsius).value ?? 0
        print("Temperature: \(temperature)")
        if temperature > 0 && temperature < 32 {
            return ContentModel.goodTempModel
        } else if temperature > 32 && temperature < 38 {
            return ContentModel.modTempModel
        } else if temperature > 38 {
            return ContentModel.badTempModel
        } else {
            return ContentModel.dummy
        }
    }

    private func getRainModel() -> ContentModel {
        // Logic to determine Good, Moderate, Bad based on weather data
        let precipitationChance = (weatherManager.curWeather?.precipitationChance ?? 0) * 100
        print("Precipitation Chance: \(precipitationChance)")
        if precipitationChance >= 0 && precipitationChance < 20 {
            return ContentModel.goodRainModel
        } else if precipitationChance > 20 && precipitationChance <= 80 {
            return ContentModel.modRainModel
        } else if precipitationChance > 80 {
            return ContentModel.badRainModel
        } else {
            return ContentModel.dummy
        }
    }

    private func getAirQualityModel() -> ContentModel {
        // Logic to determine Good, Moderate, Bad based on weather data
        if let forecast = filteredForecast.first {
            print("Air Quality: \(forecast.avg)")
            if forecast.avg > 0 && forecast.avg <= 50 {
                return ContentModel.goodAirQualityModel
            } else if forecast.avg > 50 && forecast.avg <= 100 {
                return ContentModel.modAirQualityModel
            } else if forecast.avg > 100 {
                return ContentModel.badAirQualityModel
            } else {
                return ContentModel.dummy
            }
        } else {
            print("No forecast available")
        }
        return ContentModel.dummy
    }

    private func getUVModel() -> ContentModel {
        // Logic to determine Good, Moderate, Bad based on weather data
        let uvIndex = weatherManager.curWeather?.uvIndex.value ?? 0
        print("UV Index: \(uvIndex)")
        if uvIndex >= 0 && uvIndex <= 2 {
            return ContentModel.goodUvModel
        } else if uvIndex > 2 && uvIndex <= 7 {
            return ContentModel.modUvModel
        } else if uvIndex > 7 {
            return ContentModel.badUvModel
        } else {
            return ContentModel.dummy
        }
    }

    private func getVitaminDModel() -> ContentModel {
        // Logic to determine Good, Moderate, Bad based on weather data
        let vitamin_d_hour = Calendar.current.component(.hour, from: selectedDate)
        print("Selected hour: \(vitamin_d_hour)")
        if vitamin_d_hour >= 8 && vitamin_d_hour < 16 {
            return ContentModel.goodVitaminDModel
        } else {
            return ContentModel.badVitaminDModel
        }
    }
    
    private func addUserInfo(){
        let newUserInfo = UserInfo()
        context.insert(newUserInfo)
    }
    
    private var filteredForecast: [AQIIndex] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDateString = dateFormatter.string(from: selectedDate)
        return airQualityModel.forecast.filter { $0.day == selectedDateString }
    }
    
}

#Preview {
    //preview bakal meledak (gatau kenapa gitu kalo pake swiftdata)
    MainView()
}

