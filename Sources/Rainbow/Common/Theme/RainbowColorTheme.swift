import SwiftUI

/// A struct representing a color theme for Rainbow components.
public struct RainbowColorTheme: RainbowBaseColorTheme {
    
    /// The background color of the theme.
    public var background: Color
    
    /// The foreground color of the theme.
    public var foreground: Color
    
    /// Returns an inverted version of the theme, swapping the background and foreground colors.
    ///
    /// - Returns: An inverted `RainbowColorTheme`.
    public func inverted() -> RainbowColorTheme {
        return RainbowColorTheme(background: self.foreground, foreground: self.background)
    }
    
    /// Initializes a new instance of `RainbowColorTheme`.
    ///
    /// - Parameters:
    ///   - background: The background color of the theme.
    ///   - foreground: The foreground color of the theme.
    public init(background: Color, foreground: Color) {
        self.background = background
        self.foreground = foreground
    }
}

/// Extension to the `RainbowColorTheme` to provide various pre-defined themes.
public extension RainbowColorTheme {
    
    /// The default color theme.
    static let `default` = RainbowColorTheme(
        background: Color.rainbowColor("systemBackground"),
        foreground: Color.rainbowColor("label")
    )
    
    /// Creates an outlined version of a theme.
    ///
    /// - Parameter theme: The theme to outline.
    /// - Returns: An outlined version of the theme.
    static func outlined(theme: RainbowColorTheme) -> RainbowColorTheme {
        let backingTheme = outlineColor(for: theme)
        return RainbowColorTheme(background: .clear, foreground: backingTheme.foreground)
    }
    
    // Various pre-defined color themes.
    
    static let outlinePrimary = RainbowColorTheme(
        background: Color.rainbowColor("outline-primary-color"),
        foreground: Color.rainbowColor("outline-primary-color")
    )
    
    static let outlineLink = RainbowColorTheme(
        background: Color.rainbowColor("outline-link-color"),
        foreground: Color.rainbowColor("outline-link-color")
    )
    
    static let outlineInfo = RainbowColorTheme(
        background: Color.rainbowColor("outline-info-color"),
        foreground: Color.rainbowColor("outline-info-color")
    )
    
    static let outlineSuccess = RainbowColorTheme(
        background: Color.rainbowColor("outline-success-color"),
        foreground: Color.rainbowColor("outline-success-color")
    )
    
    static let outlineWarning = RainbowColorTheme(
        background: Color.rainbowColor("outline-warning-color"),
        foreground: Color.rainbowColor("outline-warning-color")
    )
    
    static let outlineDanger = RainbowColorTheme(
        background: Color.rainbowColor("outline-danger-color"),
        foreground: Color.rainbowColor("outline-danger-color")
    )
    
    static let white = RainbowColorTheme(
        background: .white,
        foreground: .black
    )
    
    static let light = RainbowColorTheme(
        background: Color(red: 0.957, green: 0.957, blue: 0.965, opacity: 1.0),
        foreground: .black
    )
    
    static let dark = RainbowColorTheme(
        background: Color(red: 0.18, green: 0.2, blue: 0.239, opacity: 1.0),
        foreground: .white
    )
    
    static let black = RainbowColorTheme(
        background: .black,
        foreground: .white
    )
    
    static let text = RainbowColorTheme(
        background: .clear,
        foreground: RainbowColorTheme.default.foreground
    )
    
    static let ghost = RainbowColorTheme(
        background: .clear,
        foreground: Color(red: 0.157, green: 0.259, blue: 1.0, opacity: 1.0)
    )
    
    static let primary = RainbowColorTheme(
        background: Color.rainbowColor("primary-background-color"),
        foreground: Color.rainbowColor("primary-foreground-color")
    )
    
    static let link = RainbowColorTheme(
        background: Color.rainbowColor("link-background-color"),
        foreground: Color.rainbowColor("link-foreground-color")
    )
    
    static let info = RainbowColorTheme(
        background: Color.rainbowColor("info-background-color"),
        foreground: Color.rainbowColor("info-foreground-color")
    )
    
    static let success = RainbowColorTheme(
        background: Color.rainbowColor("success-background-color"),
        foreground: Color.rainbowColor("success-foreground-color")
    )
    
    static let warning = RainbowColorTheme(
        background: Color.rainbowColor("warning-background-color"),
        foreground: Color.rainbowColor("warning-foreground-color")
    )
    
    static let danger = RainbowColorTheme(
        background: Color.rainbowColor("danger-background-color"),
        foreground: Color.rainbowColor("danger-foreground-color")
    )
    
    static let primaryLight = RainbowColorTheme(
        background: Color.rainbowColor("primary-background-color-light"),
        foreground: Color.rainbowColor("primary-foreground-color-light")
    )
    
    static let linkLight = RainbowColorTheme(
        background: Color.rainbowColor("link-background-color-light"),
        foreground: Color.rainbowColor("link-foreground-color-light")
    )
    
    static let infoLight = RainbowColorTheme(
        background: Color.rainbowColor("info-background-color-light"),
        foreground: Color.rainbowColor("info-foreground-color-light")
    )
    
    static let successLight = RainbowColorTheme(
        background: Color.rainbowColor("success-background-color-light"),
        foreground: Color.rainbowColor("success-foreground-color-light")
    )
    
    static let warningLight = RainbowColorTheme(
        background: Color.rainbowColor("warning-background-color-light"),
        foreground: Color.rainbowColor("warning-foreground-color-light")
    )
    
    static let dangerLight = RainbowColorTheme(
        background: Color.rainbowColor("danger-background-color-light"),
        foreground: Color.rainbowColor("danger-foreground-color-light")
    )
    
    /// Returns the outline color for the specified theme.
    ///
    /// - Parameter theme: The theme to get the outline color for.
    /// - Returns: The outline color for the specified theme.
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

