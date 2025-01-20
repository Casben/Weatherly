//
//  SelectedCityManager.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/18/25.
//

import Foundation

class SelectedCityManager: ObservableObject {
    
    //MARK: - Properties
    
    static let shared = SelectedCityManager()
    
    @Published var cityWasSaved = false
    var defaults = UserDefaults.standard
    private let city = "city"
    var cachedCity = "" {
        didSet {
            WeatherManagerViewModel.shared.fetchWeather(For: cachedCity)
        }
    }
}

extension SelectedCityManager: SelectedCityManagerProtocol {
    
    //MARK: - Protocol Methods
    
    func storeSelectedCity(_ cityName: String) {
        removeSelectedCity()
        defaults.set(cityName, forKey: city)
        cachedCity = cityName
        cityWasSaved = true
    }
    
    func retreiveSelectedCity() -> String? {
        return defaults.string(forKey: city)
    }
    
    func removeSelectedCity() {
        defaults.removeObject(forKey: city)
        cityWasSaved = false
    }
    
    func checkIfCityWasSavedPrior() {
        if defaults.string(forKey: city) != nil {
            cachedCity = retreiveSelectedCity() ?? ""
            WeatherManagerViewModel.shared.fetchWeather(For: cachedCity)
        }
    }
}
