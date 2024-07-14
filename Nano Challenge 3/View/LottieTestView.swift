//
//  LottieTestView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 12/07/24.
//

import SwiftUI

struct LottieTestView: View {
    @StateObject private var viewModel = AQIViewModel()
    
    var body: some View {
        VStack {
            Text("City: \(viewModel.cityName)")
            Text("AQI: \(viewModel.aqi)")
            Text("Status: \(viewModel.status)")
        }
        .onAppear {
            viewModel.fetchAQI()
        }
        
        LottieView(name: "Animation - 1720746227333", loopMode: .loop)
        Text("Loading")
            .padding()
    }
}

#Preview {
    LottieTestView()
}
