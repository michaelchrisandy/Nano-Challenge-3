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
    let city: City
}

struct City: Codable {
    let name: String
}
