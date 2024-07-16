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
            GifImageView("1")
                        .frame(width: 200, height: 200)
            Text("Loading")
                .padding()
        }
        .background(.teal)
        .onAppear {
            viewModel.fetchAQI()
        }
        
//        LottieView(name: "ezgif-7-7f3d19aafc.mp4.lottie", loopMode: .loop)
//            .background(.black)
//        GifHelper("1")
//                    .frame(width: 200, height: 200) // Adjust size as needed
//        Text("Loading")
//            .padding()
    }
}

#Preview {
    LottieTestView()
}
