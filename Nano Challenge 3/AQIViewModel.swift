//
//  AQIViewModel.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 10/07/24.
//

import Foundation
import Combine

class AQIViewModel: ObservableObject {
    @Published var aqi: Int = 0
    @Published var cityName: String = ""
    @Published var status: String = ""
    var token = "4c6a9099d4971013a829bbbeb741939e03f9c745"
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAQI() {
        guard let url = URL(string: "https://api.waqi.info/feed/here/?token=\(token)") else { return }

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
            })
            .store(in: &cancellables)
    }
}
