import SwiftUI

/// A struct representing the color theme for a RainbowToggle.
public struct RainbowToggleColorTheme {
    
    /// The border color of the toggle.
    let borderColor: Color
    
    /// The background color of the toggle.
    let backgroundColor: Color
    
    /// The background color of the selected state of the toggle.
    let selectedBackgroundColor: Color
    
    /// The foreground (icon tint) color of the toggle.
    let foregroundColor: Color
}

public extension RainbowToggleColorTheme {
    
    /// The default color theme for the toggle.
    static let `default` = RainbowToggleColorTheme(
        borderColor: .black,
        backgroundColor: .clear,
        selectedBackgroundColor: .clear,
        foregroundColor: .black
    )
    
    /// Creates a `RainbowToggleColorTheme` from a given `RainbowColorTheme`.
    /// - Parameter colorTheme: The base color theme to derive the toggle color theme from.
    /// - Returns: A new `RainbowToggleColorTheme` based on the given color theme.
    static func theme(from colorTheme: RainbowColorTheme) -> RainbowToggleColorTheme {
        return RainbowToggleColorTheme(
            borderColor: colorTheme.background,
            backgroundColor: .clear,
            selectedBackgroundColor: colorTheme.background,
            foregroundColor: colorTheme.foreground
        )
    }
    
    static let primary = theme(from: .primary)
    static let info = theme(from: .info)
    static let link = theme(from: .link)
    static let success = theme(from: .success)
    static let warning = theme(from: .warning)
    static let danger = theme(from: .danger)
    
    static let primaryLight = theme(from: .primaryLight)
    static let infoLight = theme(from: .infoLight)
    static let linkLight = theme(from: .linkLight)
    static let successLight = theme(from: .successLight)
    static let warningLight = theme(from: .warningLight)
    static let dangerLight = theme(from: .dangerLight)
    
    static let primaryInverted = theme(from: .primary.inverted())
    static let infoInverted = theme(from: .info.inverted())
    static let linkInverted = theme(from: .link.inverted())
    static let successInverted = theme(from: .success.inverted())
    static let warningInverted = theme(from: .warning.inverted())
    static let dangerInverted = theme(from: .danger.inverted())
    
    /// Creates an outlined `RainbowToggleColorTheme` from a given `RainbowColorTheme`.
    /// - Parameter colorTheme: The base color theme to derive the outlined toggle color theme from.
    /// - Returns: A new outlined `RainbowToggleColorTheme` based on the given color theme.
    static func outlinedTheme(from colorTheme: RainbowColorTheme) -> RainbowToggleColorTheme {
        return RainbowToggleColorTheme(
            borderColor: colorTheme.background,
            backgroundColor: .clear,
            selectedBackgroundColor: .clear,
            foregroundColor: colorTheme.background
        )
    }
    
    static let outlinedPrimary = outlinedTheme(from: .primary)
    static let outlinedInfo = outlinedTheme(from: .info)
    static let outlinedLink = outlinedTheme(from: .link)
    static let outlinedSuccess = outlinedTheme(from: .success)
    static let outlinedWarning = outlinedTheme(from: .warning)
    static let outlinedDanger = outlinedTheme(from: .danger)
}

