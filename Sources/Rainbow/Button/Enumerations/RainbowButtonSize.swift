//
//  RainbowButtonSize.swift
//
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// An enum representing different sizes for a Rainbow Button.
public enum RainbowButtonSize {
    /// A small size for the button.
    case small
    /// A medium size for the button.
    case medium
    /// A normal size for the button.
    case normal
    /// A large size for the button.
    case large
    /// An extra large size for the button.
    case extraLarge
    /// A jumbo size for the button.
    case jumbo
    
    /// The font associated with the button size.
    var font: Font {
        switch self {
        case .small:
            return .caption2
        case .normal:
            return .body
        case .medium:
            return .callout
        case .large:
            return .title3
        case .extraLarge:
            return .title2
        case .jumbo:
            return .largeTitle
        }
    }
    
    /// The padding associated with the button size.
    var padding: EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        case .normal:
            return EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
        case .medium:
            return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .large:
            return EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        case .extraLarge:
            return EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        case .jumbo:
            return EdgeInsets(top: 14, leading: 28, bottom: 14, trailing: 28)
        }
    }
    
    /// The suggested height associated with the button size.
    var suggestedHeight: CGFloat {
        switch self {
        case .small:
            return 24 / 2
        case .normal:
            return 30 / 2
        case .medium:
            return 36 / 2
        case .large:
            return 42 / 2
        case .extraLarge:
            return 48 / 2
        case .jumbo:
            return 56 / 2
        }
    }
}
