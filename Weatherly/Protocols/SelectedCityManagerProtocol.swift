//
//  SelectedCityManagerProtocol.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import Foundation

//MARK: - SelectedCityManagerProtocol

protocol SelectedCityManagerProtocol {
    func storeSelectedCity(_ cityName: String)
    func retreiveSelectedCity() -> String?
    func removeSelectedCity()
    func checkIfCityWasSavedPrior()
}
