//
//  SheetView2.swift
//  Nano Challenge 3
//
//  Created by Michael Chrisandy on 11/07/24.
//

import SwiftUI
import MapKit
import Contacts

struct SheetView: View {
    @Binding var searchLocation: String
    @Binding var selectedLocation: MKMapItem?
    @Binding var isSheetPresented: Bool
    @State private var suggestedLocations: [MKMapItem] = []
    @StateObject private var locationManager = LocationManager()
    
    @ObservedObject var sharedData : SharedData
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack{
            
            HStack {
                TextField("", text: $searchLocation, prompt: Text("Insert a location").foregroundStyle(.gray))
                    .autocorrectionDisabled()
                    .onChange(of: searchLocation) {
                        performSearch()
                    }
                    .focused($isTextFieldFocused)
                
                if !searchLocation.isEmpty {
                    Button(action: {
                        self.searchLocation = ""
                        self.selectedLocation = nil
                        sharedData.isLocationEmpty = true
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
            }
            .padding(8)
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
            
            //list of suggested location
            List(suggestedLocations, id: \.self) { location in
                Button(action: {
                    selectedLocation = location
                    searchLocation = selectedLocation!.name!
                    isSheetPresented = false
                    sharedData.isLocationEmpty = false
                    UIApplication.shared.dismissKeyboard()
                }) {
                    VStack(alignment: .leading) {
                        Text(location.name ?? "Unknown")
                            .font(.headline)
                        Text(location.placemark.title ?? "No address")
                            .font(.subheadline)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding()
        .onAppear{
            locationManager.startUpdatingLocation()
            isTextFieldFocused = true
        }
    }
    
    private func performSearch() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchLocation
        request.region = MKCoordinateRegion(
            center: locationManager.location?.coordinate ??  CLLocationCoordinate2D(latitude: -6.200000, longitude: 106.816666),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(String(describing: error))")
                return
            }
            
            self.suggestedLocations = response.mapItems
        }
    }
    
    func createDummyMapItem() -> MKMapItem {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // San Francisco coordinates
        let addressDictionary: [String: Any] = [
            CNPostalAddressStreetKey: "1 Market St",
            CNPostalAddressCityKey: "San Francisco",
            CNPostalAddressStateKey: "CA",
            CNPostalAddressPostalCodeKey: "94105",
            CNPostalAddressCountryKey: "United States"
        ]
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Test Location"
        mapItem.phoneNumber = "123-456-7890"
        
        return mapItem
    }
}

#Preview {
    @State var searchLocation: String = ""
    @State var selectedLocation : MKMapItem? = createDummyMapItem()
    @State var isSheetPresented: Bool = true
    return SheetView(searchLocation: $searchLocation, selectedLocation: $selectedLocation, isSheetPresented: $isSheetPresented, sharedData: SharedData())
    
    func createDummyMapItem() -> MKMapItem {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // San Francisco coordinates
        let addressDictionary: [String: Any] = [
            CNPostalAddressStreetKey: "1 Market St",
            CNPostalAddressCityKey: "San Francisco",
            CNPostalAddressStateKey: "CA",
            CNPostalAddressPostalCodeKey: "94105",
            CNPostalAddressCountryKey: "United States"
        ]
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Test Location"
        mapItem.phoneNumber = "123-456-7890"
        
        return mapItem
    }
}
