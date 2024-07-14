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
    @State private var searchLocation : String = "" //text field binding
    @State private var selectedLocation : MKMapItem? //when the user select a location
    @State private var isSheetPresented: Bool = false //to show SheetView
    
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
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("", text: $searchLocation, prompt: Text("Where do you want to go?").foregroundStyle(.blue))
                    .autocorrectionDisabled()
                    .onTapGesture {
                        self.isSheetPresented = true
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        SheetView(searchLocation: $searchLocation, selectedLocation: $selectedLocation, isSheetPresented: $isSheetPresented)
                    }
            }
            .padding(8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal, 40)

            
//            DatePicker(
//                "Time",
//                selection: $selectedDate,
//                in: dateRange,
//                displayedComponents: [.date, .hourAndMinute]
//            )
            
            HStack {
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(.gray)
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        in: dateRange,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.compact)
                }
                HStack {
                    Image(systemName: "calendar")
                        .padding(.leading, 40)
                        .foregroundStyle(.gray)
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        in: dateRange,
                        displayedComponents: .hourAndMinute
                    )
                }
            }
            .padding(.horizontal, 40)
        }
        .padding(.vertical)
        .background(.white)
    }
}


#Preview {
    SearchView()
}
