//
//  ColorExtension.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

extension Color {
    
    // Cores primarias
    static let principal = Color(hex: 0x5BCCFE)
    static let principal2 = Color(hex: 0x2E8BB3)
    static let principal3 = Color(hex: 0xFF758C)
    static let principal4 = Color(hex: 0xFFF642)
    static let principal5 = Color(hex: 0xB3AD37)
    
    static let danger = Color(hex: 0xB34053)
    
    static let textColorDark = Color(hex: 0x0D2F3B)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
