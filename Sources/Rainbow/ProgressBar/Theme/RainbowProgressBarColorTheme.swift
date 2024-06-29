import SwiftUI

/// A struct representing a color theme for the Rainbow UI components.
public struct RainbowProgressBarColorTheme: Equatable {
    
    /// The background color of the theme.
    public let backgroundColors: [Color]
    
    /// The foreground color of the theme.
    public let foregroundColors: [Color]
    
    /// Initializes a new instance of `RainbowProgressBarColorTheme` with the specified colors.
    ///
    /// - Parameters:
    ///   - backgroundColors: The background colors of the theme. Default is `[.gray.opacity(0.1)]`.
    ///   - foregroundColors: The foreground colors of the theme. Default is `[Color.rainbowColor("default-progress-foreground-color")]`.
    public init(backgroundColors: [Color] = [.gray.opacity(0.1)], foregroundColors: [Color] = [Color.rainbowColor("default-progress-foreground-color")]) {
        self.backgroundColors = backgroundColors
        self.foregroundColors = foregroundColors
    }
}

public extension RainbowProgressBarColorTheme {
    
    /// The default color theme for the progress bar.
    static var `default`: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme()
    }
    
    /// A rainbow color theme for the progress bar.
    static var rainbow: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: RainbowDefaults.colors)
    }
    
    /// A primary color theme for the progress bar.
    static var primary: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("primary-background-color")])
    }
    
    /// A link color theme for the progress bar.
    static var link: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("link-background-color")])
    }
    
    /// An info color theme for the progress bar.
    static var info: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("info-background-color")])
    }
    
    /// A success color theme for the progress bar.
    static var success: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("success-background-color")])
    }
    
    /// A warning color theme for the progress bar.
    static var warning: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("warning-background-color")])
    }
    
    /// A danger color theme for the progress bar.
    static var danger: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("danger-background-color")])
    }
    
    // Light themes
    
    /// A light primary color theme for the progress bar.
    static var primaryLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("primary-background-color-light")])
    }
    
    /// A light link color theme for the progress bar.
    static var linkLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("link-background-color-light")])
    }
    
    /// A light info color theme for the progress bar.
    static var infoLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("info-background-color-light")])
    }
    
    /// A light success color theme for the progress bar.
    static var successLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("success-background-color-light")])
    }
    
    /// A light warning color theme for the progress bar.
    static var warningLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("warning-background-color-light")])
    }
    
    /// A light danger color theme for the progress bar.
    static var dangerLight: RainbowProgressBarColorTheme {
        RainbowProgressBarColorTheme(foregroundColors: [Color.rainbowColor("danger-background-color-light")])
    }
}
