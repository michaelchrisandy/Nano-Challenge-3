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
            static let status = String(localized: "Good") // the topmost
            static let title = String(localized:"Safe to play") // the headline
            static let detail = String(localized: "Toddlers can enjoy being outside") // the detail
        }
        struct Moderate {
            static let status = String(localized:"Moderate")
            static let title = String(localized:"It’s a bit hot")
            static let detail = String(localized:"Make sure toddlers drink water, wear light clothes, and use sunscreen")
        }
        struct Bad {
            static let status = String(localized:"Sunny")
            static let title = String(localized:"Extremely Hot")
            static let detail = String(localized:"Avoid outdoor activities and keep toddlers hydrated")
        }
    }
    struct Rain {
        struct Good {
            static let status = String(localized:"Clear")
            static let title = String(localized:"Good to go")
            static let detail = String(localized:"No rain, perfect for outdoor play")
        }
        struct Moderate {
            static let status = String(localized:"Drizzle")
            static let title = String(localized:"Light rain")
            static let detail = String(localized:"Toddlers can play outside with an umbrella or raincoat")
        }
        struct Bad {
            static let status = String(localized:"Bad")
            static let title = String(localized:"High Risk")
            static let detail = String(localized:"There is a heavy rain potential\nBetter to stay indoors")
        }
    }
    struct AirQuality {
        struct Good {
            static let status = String(localized:"Good")
            static let title = String(localized:"Air quality is great")
            static let detail = String(localized:"Toddlers can safely play outside")
        }
        struct Moderate {
            static let status = String(localized:"Moderate")
            static let title = String(localized:"Air quality is acceptable")
            static let detail = String(localized:"Air quality is okay but watch out if your toddler has breathing issues")
        }
        struct Bad {
            static let status = String(localized:"Bad")
            static let title = String(localized:"Unhealthy")
            static let detail = String(localized: "Limit outdoor playtime for toddlers, especially if they have health issues")
        }
    }
    struct UV {
        struct Good {
            static let status = String(localized:"Good")
            static let title = String(localized:"Low UV risk")
            static let detail = String(localized:"Sunscreen is optional, but recommended if you burn easily")
        }
        struct Moderate {
            static let status = String(localized:"Moderate")
            static let title = String(localized:"Moderate UV Risk")
            static let detail = String(localized:"Use sunscreen, hats, and stay in the shade during midday")
        }
        struct Bad {
            static let status = String(localized:"Bad")
            static let title = String(localized:"High UV risk")
            static let detail = String(localized:"Avoid direct sun and find shade")
        }
    }
    struct VitaminD {
        struct Good {
            static let status = String(localized:"Good")
            static let title = String(localized:"Best Time for Vitamin D")
            static let detail = String(localized:"10 - 15 Minutes in the sun is enough")
        }
        struct Moderate {
            static let status = String(localized:"Sunny")
            static let title = String(localized:"Best time for Vitamin D")
            static let detail = String(localized:"10 - 15 Minutes in the sun is enough")
        }
        struct Bad {
            static let status = String(localized:"Not the time")
            static let title = String(localized:"Not the Time for Vitamin D")
            static let detail = String(localized:"The best time for vitamin D is 10 AM - 4 PM")
        }
    }
}
