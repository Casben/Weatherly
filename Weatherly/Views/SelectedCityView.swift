//
//  SelectedCityView.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

struct SelectedCityView: View {
    //MARK: - Properties
    
    @EnvironmentObject var viewModel: WeatherManagerViewModel
    @EnvironmentObject var selectedCityManager: SelectedCityManager
    
    var body: some View {
        HStack {
            
            //MARK: - Temperature Details
            
            VStack(alignment: .center) {
                Text(SelectedCityManager.shared.cachedCity)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding([.top, .leading])
                
                VStack(alignment: .trailing, spacing: -20) {
                    Text("°")
                        .padding(.leading, 16)
                    Text(String(viewModel.current.temperature))
                        .fontWeight(.semibold)
                        .font(.system(size: 60))
                }
                .padding(.vertical, 2)
            }
            .padding()
            Spacer()
            
            //MARK: - Weather Icon
            
            WeatherIconView(iconUrl: viewModel.current.condition.icon)
            .frame(width: 123, height: 113)
                .padding()
        }
        .frame(width: 336, height: 117)
        .modifier(MainUIGrayWithCornerRadius())
        Spacer()
            
    }
}

#Preview {
    SelectedCityView()
        .environmentObject(WeatherManagerViewModel.shared)
        .environmentObject(SelectedCityManager.shared)
}
