import SwiftUI

extension RainbowProgressBarConfiguration {
    
    /// A builder class for creating instances of `RainbowProgressBarConfiguration`.
    public class Builder {
        private var theme: RainbowProgressBarColorTheme = .default
        private var shape: RainbowShapeType = .rectangle
        private var animation: Animation = .easeInOut(duration: 0.2)
        private var border: RainbowBorderOptions = RainbowBorderOptions()
        
        /// Initializes a new instance of `Builder`.
        public init() {}
        
        /// Sets the color theme of the progress bar.
        ///
        /// - Parameter theme: The color theme of the progress bar.
        /// - Returns: The builder instance.
        public func setTheme(_ theme: RainbowProgressBarColorTheme) -> Builder {
            self.theme = theme
            return self
        }
        
        /// Sets the shape type of the progress bar.
        ///
        /// - Parameter shape: The shape type of the progress bar.
        /// - Returns: The builder instance.
        public func setShape(_ shape: RainbowShapeType) -> Builder {
            self.shape = shape
            return self
        }
        
        /// Sets the animation applied to the progress bar.
        ///
        /// - Parameter animation: The animation applied to the progress bar.
        /// - Returns: The builder instance.
        public func setAnimation(_ animation: Animation) -> Builder {
            self.animation = animation
            return self
        }
        
        /// Sets the border options of the progress bar.
        ///
        /// - Parameter border: The border options of the progress bar.
        /// - Returns: The builder instance.
        public func setBorder(_ border: RainbowBorderOptions) -> Builder {
            self.border = border
            return self
        }
        
        /// Builds a new instance of `RainbowProgressBarConfiguration` with the specified options.
        ///
        /// - Returns: A new instance of `RainbowProgressBarConfiguration` with the specified options.
        public func build() -> RainbowProgressBarConfiguration {
            return RainbowProgressBarConfiguration(
                theme: theme,
                shape: shape == .circle ? .capsule : shape,
                animation: animation,
                border: border
            )
        }
    }
}
