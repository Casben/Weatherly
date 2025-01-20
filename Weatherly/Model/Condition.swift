//
//  Condition.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/19/25.
//

import Foundation

struct Condition: Decodable {
    let icon: String
    
    // Coding keys to match and consume API
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        
    }
}
