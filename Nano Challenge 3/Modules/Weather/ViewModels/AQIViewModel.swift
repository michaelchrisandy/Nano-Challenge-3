//
//  AQIViewModel.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 10/07/24.
//

import Foundation
import Combine
import MapKit

import Foundation
import Combine
import MapKit

class AQIViewModel: ObservableObject {
    @Published var aqi: Int = 0
    @Published var cityName: String = ""
    @Published var status: String = ""
    @Published var forecast: [AQIIndex] = []

    var token = "4c6a9099d4971013a829bbbeb741939e03f9c745"
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAQI(latitude: Double, longitude: Double) {
        let urlString = "https://api.waqi.info/feed/geo:\(latitude);\(longitude)/?token=\(token)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: AQIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.aqi = response.data.aqi
                self?.cityName = response.data.city.name
                self?.status = response.status
                if let forecast = response.data.forecast?.daily?.pm25 {
                    self?.forecast = forecast
                }
            })
            .store(in: &cancellables)
    }
}
