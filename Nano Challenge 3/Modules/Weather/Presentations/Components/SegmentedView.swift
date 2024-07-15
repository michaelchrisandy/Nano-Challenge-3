////
////  SegmentedView.swift
////  Nano Challenge 3
////
////  Created by Nafis-Macbook on 15/07/24.
////
//
//import SwiftUI
//
//struct SegmentedView: View {
//    @State var segmentedSelection = 0
//    @StateObject private var weatherManager = WeatherManager()
//    @State private var selectedDate = Date()
//    
//    var body: some View {
//        VStack {
//            
//            Picker(selection: $segmentedSelection, label: Text("text")) {
//                Text("Temp").tag(0)
//                Text("Rain").tag(1)
//                Text("AQI").tag(2)
//                Text("UV").tag(3)
//                Text("Vit D").tag(4)
//            }
//            .pickerStyle(.segmented)
//            .padding()
//            
//            switch segmentedSelection {
//            case 0:
//                TempView(selectedDate: $selectedDate, weatherManager: weatherManager)
//            case 1:
//                RainView()
//            case 2:
//                AirPollutionView()
//            case 3:
//                UVView()
//            case 4:
//                VitaminView()
//            default:
//                TempView(selectedDate: $selectedDate, weatherManager: weatherManager)          }
//            
//        }
//    }
//}
//
//#Preview {
//    SegmentedView()
//}
