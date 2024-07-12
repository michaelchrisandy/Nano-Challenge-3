//
//  WeatherView.swift
//  Nano Challenge 3
//
//  Created by Rania Pryanka Arazi on 12/07/24.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    @State private var weatherManager = WeatherManager()
    @State private var location = ""
    @State private var coordinate: CLLocationCoordinate2D? //holds geographic coordinates (latitude and longitude) of the location
    @State private var hourlyForecast: [String] = []
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("Enter Location", text: $location)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Get Weather") {
                locationManager.getCoordinate(addressString: location) { coordinate, error in //location to coordinate
                    if let coordinate = coordinate {
                        self.coordinate = coordinate
                        Task {
                            await weatherManager.getWeather(lat: coordinate.latitude, long: coordinate.longitude) //passing the latitude and longitude of the coordinates
                            hourlyForecast = weatherManager.getHourlyForecast() //hourly forecast data
                        }
                    }
                }
            }
            .padding()
            
            if let _ = coordinate { //coordinate state property is not nil
                Image(systemName: weatherManager.icon)
                    .font(.largeTitle)
                    .shadow(radius: 2)
                    .padding()
                
                //display curr weather
                Text("Temperature: \(weatherManager.temperature)")
                Text("Humidity: \(weatherManager.humidity)")
                Text("UV Index: \(weatherManager.uvIndex)")
                
                // Display hourly forecast
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(hourlyForecast, id: \.self) { forecast in
                            Text(forecast)
                                .padding(.vertical, 2)
                        }
                    }
                }
                .padding()
                
            }
        }
        .padding()
        .font(.title3)
    }
    
}

#Preview {
    WeatherView()
}
