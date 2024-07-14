//
//  locationManager.swift
//  Nano Challenge 3
//
//  Created by Rania Pryanka Arazi on 12/07/24.
//

import Foundation
import CoreLocation

//convert the address string into geographic coordinates
class locationManager {
    static func getCoordinate(addressString: String, completionHandler: @escaping(CLLocationCoordinate2D?, NSError?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { placemarks, error in
            if let error = error {
                completionHandler(nil, error as NSError)
            } else if let placemark = placemarks?.first {
                completionHandler(placemark.location?.coordinate, nil)
            }
        }
    }
}
