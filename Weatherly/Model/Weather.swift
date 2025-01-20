//
//  Weather.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import Foundation

struct Weather: Decodable {
    let current: Current?
    
    // Coding keys to match and consume API
    enum CodingKeys: String, CodingKey {
        case current = "current"
    }
}
