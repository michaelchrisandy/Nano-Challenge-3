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
    @ObservedObject var airQualityModel = AQIViewModel()

    
    @Environment(\.colorScheme) var colorScheme //detect dark mode
    
    @State var contentColor : Color = Color.contentGood
    
    var body: some View {
        let temperature = weatherManager.curWeather?.temperature.converted(to: .celsius).value
        let uvIndex = weatherManager.curWeather?.uvIndex.value
        let precipitationChance = weatherManager.curWeather?.precipitationChance
        let airPollutionIndex: Int? = airQualityModel.aqi
        
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(contentColor.opacity(colorScheme == .dark ? 0.2 : 0.05))
                .stroke(contentColor, lineWidth: 3)
            
            VStack {          
                switch selectedSegment {
                    // temp rain aqi uv D
                case 0:
                    if let temperature = temperature {
                        Text("\(temperature, specifier: "%.0f")°C")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text(contentModel.status)
                            .foregroundStyle(colorScheme == .dark ? .white : .gray)
                            .padding(.bottom, -100)
                    } else {
                        Text("--")
                    }
                case 1:
                    if let precipitationChance = precipitationChance {
                        Text("\(precipitationChance * 100, specifier: "%.0f") %")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text(contentModel.status)
                            .foregroundStyle(colorScheme == .dark ? .white : .gray)
                            .padding(.bottom, -100)
                    } else {
                        Text("--")
                    }
                case 2:
                    if let airPollutionIndex = airPollutionIndex {
                        Text("\(airPollutionIndex) AQI")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text(contentModel.status)
                            .foregroundStyle(colorScheme == .dark ? .white : .gray)
                            .padding(.bottom, -100)
                    } else {
                        Text("--")
                    }
                case 3:
                    if let uvIndex = uvIndex {
                        Text("\(uvIndex, specifier: "%d") index")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text(contentModel.status)
                            .foregroundStyle(colorScheme == .dark ? .white : .gray)
                            .padding(.bottom, -100)
                    } else {
                        Text("--")
                    }
                case 4:
                    if Calendar.current.component(.hour, from: selectedDate) >= 8 && Calendar.current.component(.hour, from: selectedDate) <= 16 {
                        Text(contentModel.status)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, -100)
                    } else {
                        Text(contentModel.status)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, -100)
                    }
                default:
                    Text(contentModel.status)
                        .foregroundStyle(.gray)
                }
                
                ZStack {
                    VStack {
                        Circle()
                            .fill(contentColor.opacity(colorScheme == .dark ? 0.5 : 0.5))
                            .frame(height: 150)
                            .blur(radius: 50)
                        Circle()
                            .fill(contentColor.opacity(colorScheme == .dark ? 0.5 : 0.5))
                            .frame(height: 150)
                            .blur(radius: 50)
                    }
                    GifImageView(contentModel.imageName)
                        .frame(height: 250)
                }
                VStack (spacing: 16){
                    Text(contentModel.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    Text(contentModel.detail)
                        .padding(.bottom, -60)
                        .font(.title3)
                        .foregroundStyle(colorScheme == .dark ? .white : .gray)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding()
            .onAppear {
                
                if(contentModel.colorStatus == 1){
                    contentColor = Color.contentGood
                }
                else if(contentModel.colorStatus == 2){
                    contentColor = Color.contentModerate
                }
                else{
                    contentColor = Color.contentBad
                }
                
            }
            .onChange(of: contentModel){
                if(contentModel.colorStatus == 1){
                    contentColor = Color.contentGood
                }
                else if(contentModel.colorStatus == 2){
                    contentColor = Color.contentModerate
                }
                else{
                    contentColor = Color.contentBad
                }
                
            }
        }
    }
}

#Preview {
    @State var weatherManager = WeatherManager()
    @State var selectedDate = Date()
    return ContentComponent(contentModel: ContentModel.badUvModel, selectedSegment: 2, selectedDate: $selectedDate, weatherManager: weatherManager)
}
