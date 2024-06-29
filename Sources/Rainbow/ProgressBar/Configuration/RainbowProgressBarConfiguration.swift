import SwiftUI

/// A struct representing the configuration options for a `RainbowProgressBar`.
public struct RainbowProgressBarConfiguration {
    
    /// The color theme of the progress bar.
    var theme: RainbowProgressBarColorTheme
    
    /// The shape type of the progress bar.
    var shapeType: RainbowShapeType
    
    /// The animation applied to the progress bar.
    var animation: Animation
    
    /// The border options of the progress bar.
    var border: RainbowBorderOptions
    
    /// Initializes a new instance of `RainbowProgressBarConfiguration`.
    ///
    /// - Parameters:
    ///   - theme: The color theme of the progress bar.
    ///   - shape: The shape type of the progress bar. Default is `.rectangle`.
    ///   - animation: The animation applied to the progress bar. Default is `.easeInOut(duration: 0.2)`.
    ///   - border: The border options of the progress bar. Default is `RainbowBorderOptions()`.
    public init(
        theme: RainbowProgressBarColorTheme,
        shape: RainbowShapeType = .rectangle,
        animation: Animation = .easeInOut(duration: 0.2),
        border: RainbowBorderOptions = RainbowBorderOptions()
    ) {
        self.theme = theme
        self.shapeType = shape
        self.animation = animation
        self.border = border
    }
}

/// Extension to provide default and configurable instances of `RainbowProgressBarConfiguration`.
extension RainbowProgressBarConfiguration {
    
    /// The default configuration for the progress bar.
    public static var `default`: RainbowProgressBarConfiguration {
        return RainbowProgressBarConfiguration.Builder()
            .setAnimation(.easeIn(duration: 0.2))
            .build()
    }

    /// Configures a new instance of `RainbowProgressBarConfiguration` with the specified theme and shape.
    ///
    /// - Parameters:
    ///   - theme: The color theme of the progress bar.
    ///   - shape: The shape type of the progress bar.
    /// - Returns: A new instance of `RainbowProgressBarConfiguration` with the specified theme and shape.
    public static func configure(_ theme: RainbowProgressBarColorTheme, _ shape: RainbowShapeType) -> RainbowProgressBarConfiguration {
        return RainbowProgressBarConfiguration.Builder()
            .setAnimation(.easeIn(duration: 0.2))
            .setTheme(theme)
            .setShape(shape)
            .build()
    }
}
