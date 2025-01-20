//
//  WeatherDetailView.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

struct WeatherDetailView: View {
    //MARK: - Properties
    
    @EnvironmentObject var viewModel: WeatherManagerViewModel
    @EnvironmentObject var selectedCityManager: SelectedCityManager
    
    var body: some View {
        
        //MARK: - Weather Icon
        
        VStack {
            WeatherIconView(iconUrl: viewModel.current.condition.icon)
            .frame(width: 123, height: 113)

            //MARK: - Selected City
            
            HStack {
                Text(selectedCityManager.retreiveSelectedCity() ?? "No City Selected.")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                Image(systemName: SFSymbolManager.locationArrow.rawValue)
            }
            

            //MARK: - Weather Details
            
            VStack {
                VStack(alignment: .trailing, spacing: -20) {
                    Text("°")
                        .font(.system(size: 24))
                        .fontWeight(.light)
                        .frame(width: 8, height: 8)
                    Text(String(viewModel.current.temperature))
                        .padding(.horizontal, 16)
                        .fontWeight(.semibold)
                        .font(.system(size: 70))
                    
                }
                HStack(spacing: 56) {
                    VStack(spacing: 2) {
                        Text("Humidity")
                            .modifier(PrimaryGrayText(fontSize: 12))
                        Text("\(viewModel.current.humidity)%")
                            .modifier(SecondaryGrayText(fontSize: 15))
                    }
                    .padding()
                    VStack(spacing: 2) {
                        Text("UV")
                            .modifier(PrimaryGrayText(fontSize: 12))
                        Text(String(viewModel.current.uvIndex))
                            .modifier(SecondaryGrayText(fontSize: 15))
                    }
                    VStack(spacing: 2) {
                        Text("Feels Like")
                            .modifier(PrimaryGrayText(fontSize: 8))
                        Text(String(viewModel.current.feelsLike) + "°")
                            .modifier(SecondaryGrayText(fontSize: 15))
                    }
                    .padding()
                }
                .modifier(MainUIGrayWithCornerRadius())
            }
        }
    }
}

#Preview {
    WeatherDetailView()
        .environmentObject(WeatherManagerViewModel.shared)
        .environmentObject(SelectedCityManager.shared)
}
