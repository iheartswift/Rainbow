import SwiftUI

/// A struct representing the color theme for the RainbowSwitch component.
public struct RainbowSwitchColorTheme {
    /// The color of the switch when it is on.
    public var onColor: Color
    /// The color of the switch when it is off.
    public var offColor: Color
    /// The color of the handle when the switch is on.
    public var handleOnColor: Color
    /// The color of the handle when the switch is off.
    public var handleOffColor: Color
    /// The border color of the handle.
    public var handleBorderColor: Color
    /// The border color of the switch.
    public var switchBorderColor: Color
    
    /// Initializes a new instance of the RainbowSwitchColorTheme with default colors.
    public init(
        onColor: Color = .green,
        offColor: Color = .gray,
        handleOnColor: Color = .white,
        handleOffColor: Color = .white,
        handleBorderColor: Color = .clear,
        switchBorderColor: Color = .clear
    ) {
        self.onColor = onColor
        self.offColor = offColor
        self.handleOnColor = handleOnColor
        self.handleOffColor = handleOffColor
        self.handleBorderColor = handleBorderColor
        self.switchBorderColor = switchBorderColor
    }
}

public extension RainbowSwitchColorTheme {
    
    /// Creates a RainbowSwitchColorTheme from a RainbowColorTheme.
    /// - Parameter theme: The RainbowColorTheme to use.
    /// - Returns: A new RainbowSwitchColorTheme instance.
    public static func theme(from theme: RainbowColorTheme) -> RainbowSwitchColorTheme {
        RainbowSwitchColorTheme(
            onColor: theme.background,
            offColor: .gray.opacity(0.2),
            handleOnColor: theme.foreground,
            handleOffColor: RainbowDefaults.adaptiveColor
        )
    }
    
    /// Creates an outlined RainbowSwitchColorTheme from a RainbowColorTheme.
    /// - Parameter theme: The RainbowColorTheme to use.
    /// - Returns: A new RainbowSwitchColorTheme instance.
    public static func outlinedTheme(from theme: RainbowColorTheme) -> RainbowSwitchColorTheme {
        RainbowSwitchColorTheme(
            onColor: .clear,
            offColor: .clear,
            handleOnColor: theme.background,
            handleOffColor: theme.background,
            switchBorderColor: theme.background
        )
    }
    
    /// Predefined color themes.
    static let primary = theme(from: .primary)
    static let link = theme(from: .link)
    static let info = theme(from: .info)
    static let success = theme(from: .success)
    static let warning = theme(from: .warning)
    static let danger = theme(from: .danger)
    
    static let primaryLight = theme(from: .primaryLight)
    static let linkLight = theme(from: .linkLight)
    static let infoLight = theme(from: .infoLight)
    static let successLight = theme(from: .successLight)
    static let warningLight = theme(from: .warningLight)
    static let dangerLight = theme(from: .dangerLight)
    
    static let primaryInverted = theme(from: .primaryLight.inverted())
    static let linkInverted = theme(from: .linkLight.inverted())
    static let infoInverted = theme(from: .infoLight.inverted())
    static let successInverted = theme(from: .successLight.inverted())
    static let warningInverted = theme(from: .warningLight.inverted())
    static let dangerInverted = theme(from: .dangerLight.inverted())
    
    static let outlinedPrimary = outlinedTheme(from: .primary)
    static let outlinedLink = outlinedTheme(from: .link)
    static let outlinedInfo = outlinedTheme(from: .info)
    static let outlinedSuccess = outlinedTheme(from: .success)
    static let outlinedWarning = outlinedTheme(from: .warning)
    static let outlinedDanger = outlinedTheme(from: .danger)
}
