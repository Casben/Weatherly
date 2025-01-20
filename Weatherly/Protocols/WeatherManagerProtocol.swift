//
//  WeatherManager.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import Foundation

//MARK: - WeatherManagerProtocol

protocol WeatherManagerProtocol {
    func performAPICall(For cityName: String, completion: @escaping (_ data: Any?) -> Void)
}
