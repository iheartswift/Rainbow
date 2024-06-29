import SwiftUI

/// A struct representing a color theme for the Rainbow UI components.
public struct RainbowButtonColorTheme: Equatable {
    
    /// The background color of the theme.
    public let background: Color
    
    /// The foreground color of the theme.
    public let foreground: Color
    
    /// The selected color of the theme.
    public let selected: Color
    
    /// Returns an inverted version of the theme.
    public func inverted() -> RainbowButtonColorTheme {
        return RainbowButtonColorTheme(background: self.foreground, foreground: self.background, selected: self.selected)
    }
    
    /// Public initializer for custom themes.
    ///
    /// - Parameters:
    ///   - background: The background color of the theme.
    ///   - foreground: The foreground color of the theme.
    ///   - selected: The selected color of the theme. Default is `.gray.opacity(0.2)`.
    public init(background: Color, foreground: Color, selected: Color = .gray.opacity(0.2)) {
        self.background = background
        self.foreground = foreground
        self.selected = selected
    }
}

/// Extensions to the `RainbowButtonColorTheme` type to provide various pre-defined themes.
extension RainbowButtonColorTheme {
    
    /// The default color theme.
    public static let `default` = RainbowButtonColorTheme(
        background: Color.rainbowColor("systemBackground"),
        foreground: Color.rainbowColor("label")
    )
    
    /// Creates an outlined version of a theme.
    ///
    /// - Parameter theme: The theme to outline.
    /// - Returns: An outlined version of the theme.
    public static func outlined(theme: RainbowButtonColorTheme) -> RainbowButtonColorTheme {
        let backingTheme = outlineColor(for: theme)
        return RainbowButtonColorTheme(background: .clear, foreground: backingTheme.foreground)
    }
    
    /// Various pre-defined color themes.
    public static let outlinePrimary = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-primary-color"),
        foreground: Color.rainbowColor("outline-primary-color")
    )
    
    public static let outlineLink = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-link-color"),
        foreground: Color.rainbowColor("outline-link-color")
    )
    
    public static let outlineInfo = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-info-color"),
        foreground: Color.rainbowColor("outline-info-color")
    )
    
    public static let outlineSuccess = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-success-color"),
        foreground: Color.rainbowColor("outline-success-color")
    )
    
    public static let outlineWarning = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-warning-color"),
        foreground: Color.rainbowColor("outline-warning-color")
    )
    
    public static let outlineDanger = RainbowButtonColorTheme(
        background: Color.rainbowColor("outline-danger-color"),
        foreground: Color.rainbowColor("outline-danger-color")
    )
    
    public static let white = RainbowButtonColorTheme(
        background: .white,
        foreground: .black
    )
    
    public static let light = RainbowButtonColorTheme(
        background: Color(red: 0.957, green: 0.957, blue: 0.965, opacity: 1.0),
        foreground: .black
    )
    
    public static let dark = RainbowButtonColorTheme(
        background: Color(red: 0.18, green: 0.2, blue: 0.239, opacity: 1.0),
        foreground: .white
    )
    
    public static let black = RainbowButtonColorTheme(
        background: .black,
        foreground: .white
    )
    
    public static let text = RainbowButtonColorTheme(
        background: .clear,
        foreground: RainbowButtonColorTheme.default.foreground
    )
    
    public static let ghost = RainbowButtonColorTheme(
        background: .clear,
        foreground: Color(red: 0.157, green: 0.259, blue: 1.0, opacity: 1.0)
    )
    
    public static let primary = RainbowButtonColorTheme(
        background: Color.rainbowColor("primary-background-color"),
        foreground: Color.rainbowColor("primary-foreground-color")
    )
    
    public static let link = RainbowButtonColorTheme(
        background: Color.rainbowColor("link-background-color"),
        foreground: Color.rainbowColor("link-foreground-color")
    )
    
    public static let info = RainbowButtonColorTheme(
        background: Color.rainbowColor("info-background-color"),
        foreground: Color.rainbowColor("info-foreground-color")
    )
    
    public static let success = RainbowButtonColorTheme(
        background: Color.rainbowColor("success-background-color"),
        foreground: Color.rainbowColor("success-foreground-color")
    )
    
    public static let warning = RainbowButtonColorTheme(
        background: Color.rainbowColor("warning-background-color"),
        foreground: Color.rainbowColor("warning-foreground-color")
    )
    
    public static let danger = RainbowButtonColorTheme(
        background: Color.rainbowColor("danger-background-color"),
        foreground: Color.rainbowColor("danger-foreground-color")
    )
    
    public static let primaryLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("primary-background-color-light"),
        foreground: Color.rainbowColor("primary-foreground-color-light")
    )
    
    public static let linkLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("link-background-color-light"),
        foreground: Color.rainbowColor("link-foreground-color-light")
    )
    
    public static let infoLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("info-background-color-light"),
        foreground: Color.rainbowColor("info-foreground-color-light")
    )
    
    public static let successLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("success-background-color-light"),
        foreground: Color.rainbowColor("success-foreground-color-light")
    )
    
    public static let warningLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("warning-background-color-light"),
        foreground: Color.rainbowColor("warning-foreground-color-light")
    )
    
    public static let dangerLight = RainbowButtonColorTheme(
        background: Color.rainbowColor("danger-background-color-light"),
        foreground: Color.rainbowColor("danger-foreground-color-light")
    )
}

/// Extensions to the `RainbowButtonColorTheme` type to provide various outline colors.
extension RainbowButtonColorTheme {
    
    /// Returns the outline color for the specified theme.
    ///
    /// - Parameter theme: The theme to get the outline color for.
    /// - Returns: The outline color for the specified theme.
    static func outlineColor(for theme: RainbowButtonColorTheme) -> RainbowButtonColorTheme {
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
