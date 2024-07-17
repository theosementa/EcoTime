//
//  Font.swift
//  EcoTime
//
//  Created by KaayZenn on 17/07/2024.
//

import Foundation
import SwiftUI

extension Font {
    
    static private let barlowRegular: String = "BarlowSemiCondensed-Regular"
    static private let barlowMedium: String = "BarlowSemiCondensed-Medium"
    static private let barlowSemiBold: String = "BarlowSemiCondensed-SemiBold"
    static private let barlowBold: String = "BarlowSemiCondensed-Bold"
    static private let barlowExtraBold: String = "BarlowSemiCondensed-ExtraBold"
    static private let barlowBlack: String = "BarlowSemiCondensed-Black"
    
    static func barlowRegular(size: CGFloat) -> Font {
        return .custom(Font.barlowRegular, size: size)
    }
    
    static func barlowMedium(size: CGFloat) -> Font {
        return .custom(Font.barlowMedium, size: size)
    }
    
    static func barlowSemiBold(size: CGFloat) -> Font {
        return .custom(Font.barlowSemiBold, size: size)
    }
    
    static func barlowBold(size: CGFloat) -> Font {
        return .custom(Font.barlowBold, size: size)
    }
    
    static func barlowExtraBold(size: CGFloat) -> Font {
        return .custom(Font.barlowExtraBold, size: size)
    }
    
    static func barlowBlack(size: CGFloat) -> Font {
        return .custom(Font.barlowBlack, size: size)
    }
}
