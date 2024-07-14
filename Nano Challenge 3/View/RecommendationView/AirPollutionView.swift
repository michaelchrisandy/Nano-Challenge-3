//
//  AQIView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct AirPollutionView: View {
    @StateObject private var viewModel = AQIViewModel()
    
    var body: some View {
        VStack {
            Text("AQI \(viewModel.aqi)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("hot")
            Text("It's polluted")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Play inside so you won't sick")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
        .onAppear {
            viewModel.fetchAQI()
        }
    }
}

#Preview {
    AirPollutionView()
}
