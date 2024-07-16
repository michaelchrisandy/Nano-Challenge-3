//
//  SearchView.swift
//  Nano Challenge 3
//
//  Created by Michael Chrisandy on 10/07/24.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @Binding var selectedDate:  Date
    @State private var searchLocation: String = "" //text field binding
    @State private var selectedLocation: MKMapItem? //when the user select a location
    @State private var isSheetPresented: Bool = false //to show SheetView
    
    @State private var weatherInfo: String = ""
    @State private var coordinate: CLLocationCoordinate2D? //holds geographic coordinates
    @ObservedObject var weatherManager: WeatherManager
    
    //user can't select a date before today
    //user can't select a time before now
    private var todayDate: Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    private var tenDaysFromToday: Date {
        return Calendar.current.date(byAdding: .day, value: 10, to: todayDate) ?? Date()
    }
    
    private var currentTime: DateComponents {
        return Calendar.current.dateComponents([.hour, .minute], from: Date())
    }
    
    private var dateRange: ClosedRange<Date> {
        let now = Calendar.current.date(bySettingHour: currentTime.hour!, minute: currentTime.minute!, second: 0, of: todayDate) ?? todayDate
        return now...tenDaysFromToday
    }
    
    var body: some View {
        
        VStack (spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("", text: $searchLocation, prompt: Text("Where do you want to go?").foregroundStyle(.gray))
                    .autocorrectionDisabled()
                    .onTapGesture {
                        self.isSheetPresented = true
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        SheetView(searchLocation: $searchLocation, selectedLocation: $selectedLocation, isSheetPresented: $isSheetPresented)
                    }
            }
            .padding(8)
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
            
            HStack {
                Text("Date").foregroundStyle(.gray)
                DatePicker("", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
//                    .colorInvert()
//                    .colorMultiply(.gray)
                    .labelsHidden()
                
                Spacer()
                
                Text("Time").foregroundStyle(.gray)
                DatePicker("", selection: $selectedDate,in: dateRange, displayedComponents: .hourAndMinute)
                    .datePickerStyle(CompactDatePickerStyle())
//                    .colorInvert()
//                    .colorMultiply(.gray)
                    .labelsHidden()
                
                
            }
            
        }
        .padding(.horizontal, 20)
        .onChange(of: selectedLocation){
            fetchWeatherData()
        }
        .onChange(of: selectedDate){
            fetchWeatherData()
        }
        
        
    }
    
    private func fetchWeatherData() {
        guard let selectedLocation = selectedLocation else { return }
        
        LocationManager.getCoordinate(addressString: selectedLocation.placemark.title ?? "") { coordinate, error in
            if let coordinate = coordinate {
                self.coordinate = coordinate
                Task {
                    await weatherManager.getWeather(lat: coordinate.latitude, long: coordinate.longitude) //passing the latitude and longitude of the coordinates
                    //                    weatherInfo = weatherManager.getWeatherForSpecificDateAndHour(date: selectedDate) ?? "No data available" //hourly forecast data
                    weatherManager.getWeatherForSpecificDateAndHour(date: selectedDate)
                }
            }
        }
    }
}



#Preview {
    @State var selectedDate = Date()
    @StateObject var weatherManager = WeatherManager()
    return SearchView(selectedDate: $selectedDate, weatherManager: weatherManager)
}
