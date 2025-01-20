//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

@main
struct WeatherlyApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .environmentObject(SelectedCityManager.shared)
                .environmentObject(WeatherManagerViewModel.shared)
        }
    }
}
