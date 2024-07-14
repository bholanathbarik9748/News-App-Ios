// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation


struct WeatherModel : Codable {
    let location: Location
    let current : Current
}

struct Location : Codable {
    let name : String
    let region: String
    let country : String
}

struct Current : Codable {
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let lastUpdated : String
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case lastUpdated = "last_updated"
    }
}

struct Condition: Codable {
    let text: String
}
