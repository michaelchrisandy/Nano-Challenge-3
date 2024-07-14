//
//  MainView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 14/07/24.
//

import SwiftUI

struct MainView: View {
    @State var segmentedSelection = 0

    var body: some View {
        VStack {
            SearchView()
            
            Picker(selection: $segmentedSelection, label: Text("text")) {
                Text("Temp").tag(0)
                Text("Rain").tag(1)
                Text("AQI").tag(2)
                Text("UV").tag(3)
                Text("Vit D").tag(4)
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch segmentedSelection {
            case 0:
                TempView()
            case 1:
                RainView()
            case 2:
                AirPollutionView()
            case 3:
                UVView()
            case 4:
                VitaminView()
            default:
                TempView()
            }
            
            Spacer()
        }
        .background(.teal.opacity(0.2))
    }
}

#Preview {
    MainView()
}
