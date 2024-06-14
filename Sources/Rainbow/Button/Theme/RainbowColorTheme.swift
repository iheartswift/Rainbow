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
    let background: Color
    
    /**
     The foreground color of the theme.
     */
    let foreground: Color
    
    /**
     Returns an inverted version of the theme.
     */
    public func inverted() -> RainbowColorTheme {
        return RainbowColorTheme(background: self.foreground, foreground: self.background)
    }
}

/**
 Extensions to the RainbowColorTheme type to provide various pre-defined themes.
 */
extension RainbowColorTheme {
    /**
     The default color theme.
     */
    public static let `default` = RainbowColorTheme(
        background: Color(UIColor.systemBackground),
        foreground: Color(UIColor.label)
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
        background: Color("outline-primary-color"),
        foreground: Color("outline-primary-color")
    )
    
    public static let outlineLink = RainbowColorTheme(
        background: Color("outline-link-color"),
        foreground: Color("outline-link-color")
    )
    
    public static let outlineInfo = RainbowColorTheme(
        background: Color("outline-info-color"),
        foreground: Color("outline-info-color")
    )
    
    public static let outlineSuccess = RainbowColorTheme(
        background: Color("outline-success-color"),
        foreground: Color("outline-success-color")
    )
    
    public static let outlineWarning = RainbowColorTheme(
        background: Color("outline-warning-color"),
        foreground: Color("outline-warning-color")
    )
    
    public static let outlineDanger = RainbowColorTheme(
        background: Color("outline-danger-color"),
        foreground: Color("outline-danger-color")
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
        foreground: Color(UIColor.label)
    )
    
    public static let ghost = RainbowColorTheme(
        background: .clear,
        foreground: Color(red: 0.157, green: 0.259, blue: 1.0, opacity: 1.0)
    )
    
    public static let primary = RainbowColorTheme(
        background: Color("primary-background-color"),
        foreground: Color("primary-foreground-color")
    )
    
    public static let link = RainbowColorTheme(
        background: Color("link-background-color"),
        foreground: Color("link-foreground-color")
    )
    
    public static let info = RainbowColorTheme(
        background: Color("info-background-color"),
        foreground: Color("info-foreground-color")
    )
    
    public static let success = RainbowColorTheme(
        background: Color("success-background-color"),
        foreground: Color("success-foreground-color")
    )
    
    public static let warning = RainbowColorTheme(
        background: Color("warning-background-color"),
        foreground: Color("warning-foreground-color")
    )
    
    public static let danger = RainbowColorTheme(
        background: Color("danger-background-color"),
        foreground: Color("danger-foreground-color")
    )
    
    public static let primaryLight = RainbowColorTheme(
        background: Color("primary-background-color-light"),
        foreground: Color("primary-foreground-color-light")
    )
    
    public static let linkLight = RainbowColorTheme(
        background: Color("link-background-color-light"),
        foreground: Color("link-foreground-color-light")
    )
    
    public static let infoLight = RainbowColorTheme(
        background: Color("info-background-color-light"),
        foreground: Color("info-foreground-color-light")
    )
    
    public static let successLight = RainbowColorTheme(
        background: Color("success-background-color-light"),
        foreground: Color("success-foreground-color-light")
    )
    
    public static let warningLight = RainbowColorTheme(
        background: Color("warning-background-color-light"),
        foreground: Color("warning-foreground-color-light")
    )
    
    public static let dangerLight = RainbowColorTheme(
        background: Color("danger-background-color-light"),
        foreground: Color("danger-foreground-color-light")
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
