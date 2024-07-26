import SwiftUI

/// Configuration object for the RainbowSwitch component.
public struct RainbowSwitchConfiguration {
    /// The size of the switch.
    public var size: RainbowSize
    /// The color theme of the switch.
    public var theme: RainbowSwitchColorTheme
    /// The color of the switch's shadow.
    public var shadowColor: Color
    /// The animation applied to the switch.
    public var animation: Animation?
    /// The shape type of the switch.
    public var shapeType: ShapeType
    
    /// The types of shapes supported by the RainbowSwitch.
    public enum ShapeType {
        case capsule
        case rectangle
    }
    
    /// Builder class for RainbowSwitchConfiguration.
    public class Builder {
        private var size: RainbowSize = .normal
        private var theme: RainbowSwitchColorTheme = RainbowSwitchColorTheme()
        private var shadowColor: Color = .black.opacity(0.4)
        private var animation: Animation? = .default
        private var shapeType: ShapeType = .capsule
        
        /// Initializes a new instance of the Builder.
        public init() {}
        
        /// Sets the size of the switch.
        /// - Parameter size: The size of the switch.
        /// - Returns: The Builder instance.
        public func setSize(_ size: RainbowSize) -> Builder {
            self.size = size
            return self
        }
        
        /// Sets the color theme of the switch.
        /// - Parameter colorTheme: The color theme of the switch.
        /// - Returns: The Builder instance.
        public func setTheme(_ theme: RainbowSwitchColorTheme) -> Builder {
            self.theme = theme
            return self
        }
        
        /// Sets the color of the switch's shadow.
        /// - Parameter color: The color of the switch's shadow.
        /// - Returns: The Builder instance.
        public func setShadowColor(_ color: Color) -> Builder {
            self.shadowColor = color
            return self
        }
        
        /// Sets the animation applied to the switch.
        /// - Parameter animation: The animation applied to the switch.
        /// - Returns: The Builder instance.
        public func setAnimation(_ animation: Animation?) -> Builder {
            self.animation = animation
            return self
        }
        
        /// Sets the shape type of the switch.
        /// - Parameter shapeType: The shape type of the switch.
        /// - Returns: The Builder instance.
        public func setShapeType(_ shapeType: ShapeType) -> Builder {
            self.shapeType = shapeType
            return self
        }
        
        /// Builds and returns the RainbowSwitchConfiguration.
        /// - Returns: The configured RainbowSwitchConfiguration instance.
        public func build() -> RainbowSwitchConfiguration {
            return RainbowSwitchConfiguration(
                size: size,
                theme: theme,
                shadowColor: shadowColor,
                animation: animation,
                shapeType: shapeType
            )
        }
    }
}

public extension RainbowSwitchConfiguration {
    
    static func configure(theme: RainbowSwitchColorTheme, size: RainbowSize = .normal) -> RainbowSwitchConfiguration {
        RainbowSwitchConfiguration.Builder()
            .setTheme(theme)
            .setSize(size)
            .build()
    }
}
