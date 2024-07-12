import Foundation
import WeatherKit
import CoreLocation

@Observable class WeatherManager {
    private let weatherService = WeatherService() //fetching weather data
    var weather: Weather? //hold the weather data
    var hourlyForecast: [HourWeather] = [] //array to hold the hourly weather forecast
    
    
    //fetch weather data using latitude and longitude
    func getWeather(lat: Double, long: Double) async {
        do {
            //fetches weather data using the WeatherService
            weather = try await Task.detached(priority: .userInitiated) { [weak self] in
                return try await self?.weatherService.weather(for: .init(latitude: lat, longitude: long))
            }.value
            
            //assigns the hourly forecast data to the hourlyForecast array.
            if let weather = weather {
                hourlyForecast = weather.hourlyForecast.forecast
            }
            
        } catch {
            print("Failed to get weather data. \(error)")
        }
    }
    
    
    //get hourly forecast for the next 10 days
    func getHourlyForecast() -> [String] {
        return hourlyForecast.map { hourWeather in
            let time = hourWeather.date.formatted(date: .numeric, time: .shortened)
            let temperature = hourWeather.temperature.converted(to: .celsius).value
            let uvIndex = hourWeather.uvIndex.value
            let symbolName = hourWeather.symbolName
            let precipitationChance = hourWeather.precipitationChance * 100
            let weatherCondition = hourWeather.condition.description

                    
            return "\(time): \(Int(temperature))°C, \(symbolName), UV Index: \(uvIndex), Rain: \(Int(precipitationChance))%, Condition: \(weatherCondition)"
        }
    }

    
    
    //display current
    var icon: String {
        guard let iconName = weather?.currentWeather.symbolName else { return "--" }
        return iconName
    }
    
    var temperature: String {
        guard let temp = weather?.currentWeather.temperature else { return "--" }
        let convert = temp.converted(to: .celsius).value
        return String(Int(convert)) + "°C"
    }
    
    var humidity: String {
        guard let humidity = weather?.currentWeather.humidity else { return "--" }
        let computedHumidity = humidity * 100
        return String(Int(computedHumidity)) + "%"
    }
    
    var uvIndex: String {
        guard let uv = weather?.currentWeather.uvIndex.value else { return "--" }
        return String(uv)
    }
    
}

