//
//  Nano_Challenge_3App.swift
//  Nano Challenge 3
//
//  Created by Michael Chrisandy on 10/07/24.
//

import SwiftUI

@main
struct Nano_Challenge_3App: App {
    @StateObject private var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            MainView(sharedData : sharedData)
        }
        .modelContainer(for: UserInfo.self)
    }
}
