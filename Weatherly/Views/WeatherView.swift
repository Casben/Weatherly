//
//  ContentView.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

struct WeatherView: View {
    //MARK: - Properties
    
    @State var text: String = ""
    @EnvironmentObject var selectedCityManager: SelectedCityManager
    @State var cityWasTapped = false
    
    var body: some View {
        VStack {
            //MARK: - City Search TextField
            
            TextField("Search Location", text: $text)
                .submitLabel(.go)
                .padding()
                .frame(width: 327, height: 46)
                .modifier(MainUIGrayWithCornerRadius())
                .modifier(PrimaryGrayText(fontSize: 15))
                .overlay(alignment: .trailing) {
                    Image(systemName: SFSymbolManager.magnifyingGlass.rawValue)
                        .frame(width: 17.49, height: 17.49)
                        .foregroundColor(.gray)
                        .padding()
                }
                .onSubmit {
                    citySearch()
                }
            Spacer()
            
            //MARK: - Selected City Control Flow
            
            if selectedCityManager.cityWasSaved == false {
                EmptyStateView()
            } else {
                if cityWasTapped == false {
                    SelectedCityView()
                        .onTapGesture {
                            cityWasTapped = true
                        }
                        .padding()
                    Spacer()
                        .frame(maxHeight: .infinity)
                } else {
                    WeatherDetailView()
                }
            }
            Spacer()
        }
        .padding()
        .onAppear {
            checkIfCityWasSaved()
        }
    }
    
    //MARK: - Methods
    
    private func citySearch() {
        selectedCityManager.storeSelectedCity(text)
        text = ""
        cityWasTapped = false
    }
    
    private func checkIfCityWasSaved() {
        selectedCityManager.checkIfCityWasSavedPrior()
    }
}

#Preview {
    WeatherView()
        .environmentObject(SelectedCityManager.shared)
        .environmentObject(WeatherManagerViewModel.shared)
}


