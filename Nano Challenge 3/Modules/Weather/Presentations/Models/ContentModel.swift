//
//  ContentModel.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 15/07/24.
//

import Foundation

struct ContentModel {
    var status: String
    var title: String
    var detail: String
    var imageName: String

    static let dummy = ContentModel(status: "Not Searched", title: "Please search for location, date, and time", detail: "", imageName: "hot")
    
    // temperature
    static let goodTempModel = ContentModel(status: Phrases.Temperature.Good.status, title: Phrases.Temperature.Good.title, detail: Phrases.Temperature.Good.detail, imageName: "hot")
    static let modTempModel = ContentModel(status: Phrases.Temperature.Moderate.status, title: Phrases.Temperature.Moderate.title, detail: Phrases.Temperature.Moderate.detail, imageName: "hot")
    static let badTempModel = ContentModel(status: Phrases.Temperature.Bad.status, title: Phrases.Temperature.Bad.title, detail: Phrases.Temperature.Bad.detail, imageName: "hot")
    
    // rain
    static let goodRainModel = ContentModel(status: Phrases.Rain.Good.status, title: Phrases.Rain.Good.title, detail: Phrases.Rain.Good.detail, imageName: "hot")
    static let modRainModel = ContentModel(status: Phrases.Rain.Moderate.status, title: Phrases.Rain.Moderate.title, detail: Phrases.Rain.Moderate.detail, imageName: "hot")
    static let badRainModel = ContentModel(status: Phrases.Rain.Bad.status, title: Phrases.Rain.Bad.title, detail: Phrases.Rain.Bad.detail, imageName: "hot")
    
    // air quality
    static let goodAirQualityModel = ContentModel(status: Phrases.AirQuality.Good.status, title: Phrases.AirQuality.Good.title, detail: Phrases.AirQuality.Good.detail, imageName: "hot")
    static let modAirQualityModel = ContentModel(status: Phrases.AirQuality.Moderate.status, title: Phrases.AirQuality.Moderate.title, detail: Phrases.AirQuality.Moderate.detail, imageName: "hot")
    static let badAirQualityModel = ContentModel(status: Phrases.AirQuality.Bad.status, title: Phrases.AirQuality.Bad.title, detail: Phrases.AirQuality.Bad.detail, imageName: "hot")
    
    // uv
    static let goodUvModel = ContentModel(status: Phrases.UV.Good.status, title: Phrases.UV.Good.title, detail: Phrases.UV.Good.detail, imageName: "hot")
    static let modUvModel = ContentModel(status: Phrases.UV.Moderate.status, title: Phrases.UV.Moderate.title, detail: Phrases.UV.Moderate.detail, imageName: "hot")
    static let badUvModel = ContentModel(status: Phrases.UV.Bad.status, title: Phrases.UV.Bad.title, detail: Phrases.UV.Bad.detail, imageName: "hot")
    
    // vitamin
    static let goodVitaminDModel = ContentModel(status: Phrases.VitaminD.Good.status, title: Phrases.VitaminD.Good.title, detail: Phrases.VitaminD.Good.detail, imageName: "hot")
    static let modVitaminDModel = ContentModel(status: Phrases.VitaminD.Moderate.status, title: Phrases.VitaminD.Moderate.title, detail: Phrases.VitaminD.Moderate.detail, imageName: "hot")
    static let badVitaminDModel = ContentModel(status: Phrases.VitaminD.Bad.status, title: Phrases.VitaminD.Bad.title, detail: Phrases.VitaminD.Bad.detail, imageName: "hot")
}
