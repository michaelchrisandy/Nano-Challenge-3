//
//  Phrases.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 15/07/24.
//

import Foundation

struct Phrases {
    struct Temperature {
        struct Good {
            static let status = "Good" // the topmost
            static let title = "Safe to play" // the headline
            static let detail = "Toddlers can enjoy being outside." // the detail
        }
        struct Moderate {
            static let status = "Moderate"
            static let title = "It’s a bit hot"
            static let detail = "Make sure toddlers drink water, wear light clothes, and use sunscreen"
        }
        struct Bad {
            static let status = "Sunny"
            static let title = "Extremely Hot"
            static let detail = "Avoid outdoor activities and keep \ntodlers hydrated"
        }
    }
    struct Rain {
        struct Good {
            static let status = "Clear"
            static let title = "Good to go"
            static let detail = "No rain, perfect for outdoor play"
        }
        struct Moderate {
            static let status = "Drizzle"
            static let title = "Light rain"
            static let detail = "Toddlers can play outside with an umbrella or raincoat"
        }
        struct Bad {
            static let status = "Bad"
            static let title = "High Risk"
            static let detail = "There is a heavy rain potential\nBetter to stay indoors"
        }
    }
    struct AirQuality {
        struct Good {
            static let status = "Good"
            static let title = "Air quality is great"
            static let detail = "Toddlers can safely play outside"
        }
        struct Moderate {
            static let status = "Moderate"
            static let title = "Air quality is acceptable"
            static let detail = "Air quality is okay but watch out if your toddler has breathing issues"
        }
        struct Bad {
            static let status = "Bad"
            static let title = "Unhealthy"
            static let detail = "Limit outdoor playtime for toddlers, especially if they have health issues"
        }
    }
    struct UV {
        struct Good {
            static let status = "Good"
            static let title = "Low UV risk"
            static let detail = "Sunscreen is optional, but recommended if you burn easily."
        }
        struct Moderate {
            static let status = "Moderate"
            static let title = "Moderate UV Risk"
            static let detail = "Use sunscreen, hats, and stay in the shade during midday"
        }
        struct Bad {
            static let status = "Bad"
            static let title = "High UV risk"
            static let detail = "Avoid direct sun and find shade"
        }
    }
    struct VitaminD {
        struct Good {
            static let status = "Good"
            static let title = "Best Time for Vitamin D"
            static let detail = "10 - 15 Minutes in the sun is enough"
        }
        struct Moderate {
            static let status = "Sunny"
            static let title = "Best time for Vitamin D"
            static let detail = "10 - 15 Minutes in the sun is enough"
        }
        struct Bad {
            static let status = "Bad"
            static let title = "Not the Time for Vitamin D"
            static let detail = "10 - 15 Minutes in the sun is enough"
        }
    }
}
