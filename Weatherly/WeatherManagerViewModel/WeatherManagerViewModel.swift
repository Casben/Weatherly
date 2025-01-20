//
//  WeatherManagerViewModel.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import Foundation

class WeatherManagerViewModel: ObservableObject {
    
    //MARK: - Properties
    
    fileprivate let apiKey = "770348230f964fed84d170411251701"
    
    static let shared = WeatherManagerViewModel()
    
    @Published var current: Current = MOCK_CURRENT
}

extension WeatherManagerViewModel: WeatherManagerProtocol {
    
    //MARK: - Methods
    
    func fetchWeather(For cityName: String) {
        performAPICall(For: cityName) { [weak self] data in
            if let weather = data as? Weather {
                self?.current = weather.current ?? MOCK_CURRENT
                SelectedCityManager.shared.cityWasSaved = true
            } else {
                SelectedCityManager.shared.cityWasSaved = false
            }
        }
    }
    
    //MARK: - Protocol Methods
    
    func performAPICall(For cityName: String, completion: @escaping (_ data: Any?) -> Void) {
        if let queryUrl = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(cityName)") {
            
            let task = URLSession.shared.dataTask(with: queryUrl) { data, response, error in
                if error != nil {
                    completion(nil)
                    return
                }
                do {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        let decodedData = try? decoder.decode(Weather.self, from: safeData)
                        DispatchQueue.main.async {
                            if decodedData?.current == nil {
                                completion(nil)
                            } else {
                                completion(decodedData)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
