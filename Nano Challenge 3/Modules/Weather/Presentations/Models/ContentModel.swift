//
//  ContentModel.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 15/07/24.
//

import Foundation

struct ContentModel : Equatable {
    var status: String
    var title: String
    var detail: String
    var imageName: String
    var colorStatus: Int
    //1 good
    //2 moderate
    //3 bad
    
    static let dummy = ContentModel(status: "Not Searched", title: "Please search for location, date, and time", detail: "", imageName: "3", colorStatus: 1)
    
    // temperature
    static let goodTempModel = ContentModel(status: Phrases.Temperature.Good.status, title: Phrases.Temperature.Good.title, detail: Phrases.Temperature.Good.detail, imageName: "1", colorStatus: 1)
    static let modTempModel = ContentModel(status: Phrases.Temperature.Moderate.status, title: Phrases.Temperature.Moderate.title, detail: Phrases.Temperature.Moderate.detail, imageName: "2", colorStatus: 2)
    static let badTempModel = ContentModel(status: Phrases.Temperature.Bad.status, title: Phrases.Temperature.Bad.title, detail: Phrases.Temperature.Bad.detail, imageName: "3", colorStatus: 3)
    
    // rain
    static let goodRainModel = ContentModel(status: Phrases.Rain.Good.status, title: Phrases.Rain.Good.title, detail: Phrases.Rain.Good.detail, imageName: "4", colorStatus: 1)
    static let modRainModel = ContentModel(status: Phrases.Rain.Moderate.status, title: Phrases.Rain.Moderate.title, detail: Phrases.Rain.Moderate.detail, imageName: "5", colorStatus: 2)
    static let badRainModel = ContentModel(status: Phrases.Rain.Bad.status, title: Phrases.Rain.Bad.title, detail: Phrases.Rain.Bad.detail, imageName: "6", colorStatus: 3)
    
    // air quality
    static let goodAirQualityModel = ContentModel(status: Phrases.AirQuality.Good.status, title: Phrases.AirQuality.Good.title, detail: Phrases.AirQuality.Good.detail, imageName: "7", colorStatus: 1)
    static let modAirQualityModel = ContentModel(status: Phrases.AirQuality.Moderate.status, title: Phrases.AirQuality.Moderate.title, detail: Phrases.AirQuality.Moderate.detail, imageName: "8", colorStatus: 2)
    static let badAirQualityModel = ContentModel(status: Phrases.AirQuality.Bad.status, title: Phrases.AirQuality.Bad.title, detail: Phrases.AirQuality.Bad.detail, imageName: "9", colorStatus: 3)
    
    // uv
    static let goodUvModel = ContentModel(status: Phrases.UV.Good.status, title: Phrases.UV.Good.title, detail: Phrases.UV.Good.detail, imageName: "10", colorStatus: 1)
    static let modUvModel = ContentModel(status: Phrases.UV.Moderate.status, title: Phrases.UV.Moderate.title, detail: Phrases.UV.Moderate.detail, imageName: "11", colorStatus: 2)
    static let badUvModel = ContentModel(status: Phrases.UV.Bad.status, title: Phrases.UV.Bad.title, detail: Phrases.UV.Bad.detail, imageName: "12", colorStatus: 3)
    
    // vitamin
    static let goodVitaminDModel = ContentModel(status: Phrases.VitaminD.Good.status, title: Phrases.VitaminD.Good.title, detail: Phrases.VitaminD.Good.detail, imageName: "13", colorStatus: 1)
    static let modVitaminDModel = ContentModel(status: Phrases.VitaminD.Moderate.status, title: Phrases.VitaminD.Moderate.title, detail: Phrases.VitaminD.Moderate.detail, imageName: "14", colorStatus: 2)
    static let badVitaminDModel = ContentModel(status: Phrases.VitaminD.Bad.status, title: Phrases.VitaminD.Bad.title, detail: Phrases.VitaminD.Bad.detail, imageName: "14", colorStatus: 3)
}
