import SwiftUI

/// Configuration object for the RainbowToggle component.
public struct RainbowToggleConfiguration {
    /// The width of the border.
    public var borderWidth: CGFloat
    
    /// The shape type of the toggle.
    public var shapeType: RainbowShapeType
    
    /// The SF Symbol used for the checkmark.
    public var imageSystemName: String
    
    /// The animation applied to the toggle transitions.
    public var animation: Animation
    
    /// The font used for the toggle content.
    public var font: Font
    
    /// The size of the toggle.
    public var size: RainbowSize
    
    /// The color theme for the toggle.
    public var theme: RainbowToggleColorTheme
    
    /// Initializes a new configuration object for the RainbowToggle.
    /// - Parameters:
    ///   - borderWidth: The width of the border.
    ///   - shapeType: The shape type of the toggle.
    ///   - imageSystemName: The SF Symbol used for the checkmark.
    ///   - animation: The animation applied to the toggle transitions.
    ///   - font: The font used for the toggle content.
    ///   - size: The size of the toggle.
    public init(
        borderWidth: CGFloat = 2.0,
        shapeType: RainbowShapeType = .roundedRectangle(),
        imageSystemName: String = "checkmark",
        animation: Animation = .easeInOut(duration: 0.3),
        font: Font = .body,
        size: RainbowSize = .normal,
        theme: RainbowToggleColorTheme = .default
    ) {
        self.borderWidth = borderWidth
        self.shapeType = shapeType
        self.imageSystemName = imageSystemName
        self.animation = animation
        self.font = font
        self.size = size
        self.theme = theme
    }
}

extension RainbowToggleConfiguration {
    
    /// Builder class for creating a RainbowToggleConfiguration.
    public class Builder {
        
        public init() { }
        
        private var configuration = RainbowToggleConfiguration()
        
        /// Sets the border width of the toggle.
        /// - Parameter width: The border width.
        /// - Returns: The builder instance.
        public func setBorderWidth(_ width: CGFloat) -> Builder {
            configuration.borderWidth = width
            return self
        }
        
        /// Sets the shape type of the toggle.
        /// - Parameter shapeType: The shape type.
        /// - Returns: The builder instance.
        public func setShapeType(_ shapeType: RainbowShapeType) -> Builder {
            configuration.shapeType = shapeType
            return self
        }
        
        /// Sets the SF Symbol used for the checkmark.
        /// - Parameter imageSystemName: The SF Symbol used for the checkmark.
        /// - Returns: The builder instance.
        public func setImageSystemName(_ imageSystemName: String) -> Builder {
            configuration.imageSystemName = imageSystemName
            return self
        }
        
        /// Sets the animation for the toggle transitions.
        /// - Parameter animation: The animation.
        /// - Returns: The builder instance.
        public func setAnimation(_ animation: Animation) -> Builder {
            configuration.animation = animation
            return self
        }
        
        /// Sets the font for the toggle content.
        /// - Parameter font: The font.
        /// - Returns: The builder instance.
        public func setFont(_ font: Font) -> Builder {
            configuration.font = font
            return self
        }
        
        /// Sets the size of the toggle.
        /// - Parameter buttonSize: The size of the toggle.
        /// - Returns: The builder instance.
        public func setSize(_ buttonSize: RainbowSize) -> Builder {
            configuration.size = buttonSize
            return self
        }
        
        /// Sets the color theme for the toggle.
        /// - Parameter theme: The color theme.
        /// - Returns: The builder instance.
        public func setTheme(_ theme: RainbowToggleColorTheme) -> Builder {
            configuration.theme = theme
            return self
        }
        
        /// Builds and returns the RainbowToggleConfiguration.
        /// - Returns: The configured RainbowToggleConfiguration instance.
        public func build() -> RainbowToggleConfiguration {
            return configuration
        }
    }
}

// MARK: - Pre built configurations

public extension RainbowToggleConfiguration {
    
    public static func configure(theme: RainbowToggleColorTheme, imageSystemName: String, shape: RainbowShapeType = .roundedRectangle()) -> RainbowToggleConfiguration {
        return RainbowToggleConfiguration.Builder()
            .setImageSystemName(imageSystemName)
            .setAnimation(.spring())
            .setTheme(theme)
            .setShapeType(shape)
            .build()
    }
}

