//
//  Current.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/19/25.
//

import Foundation

struct Current: Decodable {
    let temperature: Double
    let humidity: Int
    let uvIndex: Double
    let feelsLike: Double
    
    let condition: Condition
    
    // Coding keys to match and consume API
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_f"
        case humidity = "humidity"
        case uvIndex = "uv"
        case feelsLike = "feelslike_f"
        case condition = "condition"
    }
}
