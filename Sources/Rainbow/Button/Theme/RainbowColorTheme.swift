//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A struct representing a color theme for the Rainbow UI components.
 */
public struct RainbowColorTheme: Equatable {
    
    /**
     The background color of the theme.
     */
    public let background: Color
    
    /**
     The foreground color of the theme.
     */
    public let foreground: Color
    
    /**
     The selected color of the theme.
     */
    public let selected: Color
    
    /**
     Returns an inverted version of the theme.
     */
    public func inverted() -> RainbowColorTheme {
        return RainbowColorTheme(background: self.foreground, foreground: self.background)
    }
    
    /**
     Public initializer for custom themes
     */
    public init(background: Color, foreground: Color, selected: Color = .gray.opacity(0.2)) {
        self.background = background
        self.foreground = foreground
        self.selected = selected
    }
}

/**
 Extensions to the RainbowColorTheme type to provide various pre-defined themes.
 */
extension RainbowColorTheme {
        
    private static func color(_ name: String) -> Color {
        return Color(name, bundle: Bundle.module)
    }
    
    /**
     The default color theme.
     */
    public static let `default` = RainbowColorTheme(
        background: color("systemBackground"),
        foreground: color("label")
    )
    
    /**
     Creates an outlined version of a theme.
     
     - Parameter theme: The theme to outline.
     - Returns: An outlined version of the theme.
     */
    public static func outlined(theme: RainbowColorTheme) -> RainbowColorTheme {
        let backingTheme = outlineColor(for: theme)
        return RainbowColorTheme(background: .clear, foreground: backingTheme.foreground)
    }
    
    /**
     Various pre-defined color themes.
     */
    public static let outlinePrimary = RainbowColorTheme(
        background: color("outline-primary-color"),
        foreground: color("outline-primary-color")
    )
    
    public static let outlineLink = RainbowColorTheme(
        background: color("outline-link-color"),
        foreground: color("outline-link-color")
    )
    
    public static let outlineInfo = RainbowColorTheme(
        background: color("outline-info-color"),
        foreground: color("outline-info-color")
    )
    
    public static let outlineSuccess = RainbowColorTheme(
        background: color("outline-success-color"),
        foreground: color("outline-success-color")
    )
    
    public static let outlineWarning = RainbowColorTheme(
        background: color("outline-warning-color"),
        foreground: color("outline-warning-color")
    )
    
    public static let outlineDanger = RainbowColorTheme(
        background: color("outline-danger-color"),
        foreground: color("outline-danger-color")
    )
    
    public static let white = RainbowColorTheme(
        background: .white,
        foreground: .black
    )
    
    public static let light = RainbowColorTheme(
        background: Color(red: 0.957, green: 0.957, blue: 0.965, opacity: 1.0),
        foreground: .black
    )
    
    public static let dark = RainbowColorTheme(
        background: Color(red: 0.18, green: 0.2, blue: 0.239, opacity: 1.0),
        foreground: .white
    )
    
    public static let black = RainbowColorTheme(
        background: .black,
        foreground: .white
    )
    
    public static let text = RainbowColorTheme(
        background: .clear,
        foreground: RainbowColorTheme.default.foreground
    )
    
    public static let ghost = RainbowColorTheme(
        background: .clear,
        foreground: Color(red: 0.157, green: 0.259, blue: 1.0, opacity: 1.0)
    )
    
    public static let primary = RainbowColorTheme(
        background: color("primary-background-color"),
        foreground: color("primary-foreground-color")
    )
    
    public static let link = RainbowColorTheme(
        background: color("link-background-color"),
        foreground: color("link-foreground-color")
    )
    
    public static let info = RainbowColorTheme(
        background: color("info-background-color"),
        foreground: color("info-foreground-color")
    )
    
    public static let success = RainbowColorTheme(
        background: color("success-background-color"),
        foreground: color("success-foreground-color")
    )
    
    public static let warning = RainbowColorTheme(
        background: color("warning-background-color"),
        foreground: color("warning-foreground-color")
    )
    
    public static let danger = RainbowColorTheme(
        background: color("danger-background-color"),
        foreground: color("danger-foreground-color")
    )
    
    public static let primaryLight = RainbowColorTheme(
        background: color("primary-background-color-light"),
        foreground: color("primary-foreground-color-light")
    )
    
    public static let linkLight = RainbowColorTheme(
        background: color("link-background-color-light"),
        foreground: color("link-foreground-color-light")
    )
    
    public static let infoLight = RainbowColorTheme(
        background: color("info-background-color-light"),
        foreground: color("info-foreground-color-light")
    )
    
    public static let successLight = RainbowColorTheme(
        background: color("success-background-color-light"),
        foreground: color("success-foreground-color-light")
    )
    
    public static let warningLight = RainbowColorTheme(
        background: color("warning-background-color-light"),
        foreground: color("warning-foreground-color-light")
    )
    
    public static let dangerLight = RainbowColorTheme(
        background: color("danger-background-color-light"),
        foreground: color("danger-foreground-color-light")
    )
}

/**
 Extensions to the RainbowColorTheme type to provide various outline colors.
 */
extension RainbowColorTheme {
    /**
     Returns the outline color for the specified theme.
     
     - Parameter theme: The theme to get the outline color for.
     - Returns: The outline color for the specified theme.
     */
    static func outlineColor(for theme: RainbowColorTheme) -> RainbowColorTheme {
        switch theme {
        case .primary:
            return .outlinePrimary
        case .link:
            return .outlineLink
        case .info:
            return .outlineInfo
        case .success:
            return .outlineSuccess
        case .warning:
            return .outlineWarning
        case .danger:
            return .outlineDanger
        default:
            return .outlinePrimary
        }
    }
}
