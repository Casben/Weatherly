//
//  CustomModifiers.swift
//  Weatherly
//
//  Created by Herbert Dodge on 1/17/25.
//

import SwiftUI

//MARK: - Custom Modifiers for UI Styling

//MARK: - Modifiers for rounded main Views

struct MainUIGrayWithCornerRadius: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .cornerRadius(16)
    }
}

//MARK: - Modifiers for text styling

struct PrimaryGrayText: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(red: 196 / 255, green: 196 / 255, blue: 196 / 255))
            .font(.system(size: fontSize))
    }
}

struct SecondaryGrayText: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(red: 154 / 255, green: 154 / 255, blue: 154 / 255))
            .font(.system(size: fontSize))
    }
}
