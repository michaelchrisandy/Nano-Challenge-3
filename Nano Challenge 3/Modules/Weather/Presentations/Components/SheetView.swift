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

    var body: some View {
        VStack{
            TextField("Search for a place", text: $searchLocation)
                .autocorrectionDisabled()
                .onChange(of: searchLocation) {
                    performSearch()
                }
                .padding()

            //list of suggested location
            List(suggestedLocations, id: \.self) { location in
                Button(action: {
                    selectedLocation = location
                    searchLocation = selectedLocation!.name!
                    isSheetPresented = false
                    InputStatus.isLocationEmpty = false
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
        }.onAppear{
            locationManager.startUpdatingLocation()
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
    return SheetView(searchLocation: $searchLocation, selectedLocation: $selectedLocation, isSheetPresented: $isSheetPresented)
    
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
