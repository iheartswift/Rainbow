import SwiftUI

// Implement the RainbowButtonColorTheme struct
public struct RainbowButtonColorTheme: Equatable, RainbowBaseColorTheme {
    public let background: Color
    public let foreground: Color
    public let selected: Color
    
    // Method to return inverted theme
    public func inverted() -> RainbowButtonColorTheme {
        return RainbowButtonColorTheme(background: self.foreground, foreground: self.background, selected: self.selected)
    }
    
    // Default initializer
    public init(background: Color, foreground: Color, selected: Color = .gray.opacity(0.2)) {
        self.background = background
        self.foreground = foreground
        self.selected = selected
    }
    
    // Initializer to convert from RainbowColorTheme
    public init(from theme: RainbowColorTheme, selected: Color = .clear) {
        self.background = theme.background
        self.foreground = theme.foreground
        self.selected = selected
    }
}
/// Extensions to the `RainbowButtonColorTheme` type to provide various pre-defined themes.
extension RainbowButtonColorTheme {

    /// The default color theme.
    public static let `default` = RainbowButtonColorTheme(from: .default)
    
    /// Creates an outlined version of a theme.
    ///
    /// - Parameter theme: The theme to outline.
    /// - Returns: An outlined version of the theme.
    public static func outlined(theme: RainbowButtonColorTheme) -> RainbowButtonColorTheme {
        let backingTheme = outlineColor(for: theme)
        return RainbowButtonColorTheme(background: .clear, foreground: backingTheme.foreground)
    }
    
    /// Various pre-defined color themes.
    public static let outlinePrimary = RainbowButtonColorTheme(from: .outlinePrimary)
    
    public static let outlineLink = RainbowButtonColorTheme(from: .outlineLink)

    public static let outlineInfo = RainbowButtonColorTheme(from: .outlineInfo)

    public static let outlineSuccess = RainbowButtonColorTheme(from: .outlineSuccess)

    public static let outlineWarning = RainbowButtonColorTheme(from: .outlineWarning)

    public static let outlineDanger = RainbowButtonColorTheme(from: .outlineDanger)

    public static let white = RainbowButtonColorTheme(from: .white)

    public static let light = RainbowButtonColorTheme(from: .light)

    public static let dark = RainbowButtonColorTheme(from: .dark)

    public static let black = RainbowButtonColorTheme(from: .black)

    public static let text = RainbowButtonColorTheme(from: .text)

    public static let ghost = RainbowButtonColorTheme(from: .ghost)

    public static let primary = RainbowButtonColorTheme(from: .primary)

    public static let link = RainbowButtonColorTheme(from: .link)

    public static let info = RainbowButtonColorTheme(from: .info)

    public static let success = RainbowButtonColorTheme(from: .success)

    public static let warning = RainbowButtonColorTheme(from: .warning)

    public static let danger = RainbowButtonColorTheme(from: .danger)

    public static let primaryLight = RainbowButtonColorTheme(from: .primaryLight)

    public static let linkLight = RainbowButtonColorTheme(from: .linkLight)

    public static let infoLight = RainbowButtonColorTheme(from: .infoLight)

    public static let successLight = RainbowButtonColorTheme(from: .successLight)

    public static let warningLight = RainbowButtonColorTheme(from: .warningLight)

    public static let dangerLight = RainbowButtonColorTheme(from: .dangerLight)
    
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
