//
//  SearchView.swift
//  Nano Challenge 3
//
//  Created by Michael Chrisandy on 10/07/24.
//

import SwiftUI
import MapKit

struct SearchView: View {
    
    @State private var selectedDate = Date()
    @State private var searchLocation : String = ""
    @State private var selectedLocation : MKMapItem?
    @State private var isSheetPresented: Bool = false
    
    //user can't select a date before today
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
        
        VStack {
            TextField("Search for a place", text: $searchLocation)
                .autocorrectionDisabled()
                .onTapGesture {
                    self.isSheetPresented = true
                }
                .sheet(isPresented: $isSheetPresented) {
                    SheetView(searchLocation: $searchLocation, selectedLocation: $selectedLocation, isSheetPresented: $isSheetPresented)
                }
            
            
            DatePicker(
                "Time",
                selection: $selectedDate,
                in: dateRange,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(.compact)
            .padding()
        }
        
        
        
    }
}


#Preview {
    SearchView()
}
