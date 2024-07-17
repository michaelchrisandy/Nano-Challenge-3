//
//  AQIResponse.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 10/07/24.
//

import Foundation

struct AQIResponse: Codable {
    let status: String
    let data: AQIData
}

struct AQIData: Codable {
    let aqi: Int
    let city: AQICity
    let forecast: AQIForecast?
}

struct AQICity: Codable {
    let name: String
}

struct AQIForecast: Codable {
    let daily: AQIDaily?
}

struct AQIDaily: Codable {
    let o3: [AQIIndex]?
    let pm10: [AQIIndex]?
    let pm25: [AQIIndex]?
}

struct AQIIndex: Codable {
    let day: String
    let avg: Int
}
