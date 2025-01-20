//
//  EmptyStateView.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

struct EmptyStateView: View {
    
    //MARK: - Properties
    
    @EnvironmentObject var selectedCityManager: SelectedCityManager
    
    var body: some View {
        Text(selectedCityManager.cityWasSaved == false ? "Invalid entry" : "No City Selected")
            .fontWeight(.bold)
            .font(.system(size: 30))
        Text(selectedCityManager.cityWasSaved == false ? "Please try again" : "Please Search For A City")
            .fontWeight(.bold)
            .font(.system(size: 15))
            .padding(.top, 2)
    }
}

#Preview {
    EmptyStateView()
        .environmentObject(SelectedCityManager.shared)
}
