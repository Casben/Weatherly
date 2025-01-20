//
//  WeatherIconView.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

struct WeatherIconView: View {
    //MARK: - Properties
    
    let iconUrl: String
    
    var body: some View {
        //MARK: - Weather Icon
        
        AsyncImage(url: URL(string: "https:" + iconUrl)) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    WeatherIconView(iconUrl: "")
}
