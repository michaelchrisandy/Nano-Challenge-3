//
//  LastSegmentSelected.swift
//  Nano Challenge 3
//
//  Created by Michael Chrisandy on 26/07/24.
//

import SwiftData
import Foundation

@Model
class UserInfo : Identifiable{
    var id = UUID()
    var lastSegmentSelected : Int
    
    init() {
        self.lastSegmentSelected = 0
    }
}
