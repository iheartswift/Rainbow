import SwiftUI

/// Configuration for the appearance of a text field in different states.
///
/// This struct defines the visual appearance of a text field including border, image tint colors, caption text, and button colors.
public struct RainbowFieldStateAppearanceConfiguration {
    
    /// A default light gray color used for various visual elements.
    public static let lightGray = Color(red: 0.875, green: 0.882, blue: 0.906, opacity: 1.0)

    // MARK: - Properties

    /// Width of the border around the text field.
    public var borderWidth: CGFloat
    
    /// Color of the border around the text field.
    public var borderColor: Color
    
    /// Tint color for the left image of the text field.
    public var leftImageTintColor: Color?
    
    /// Tint color for the right image of the text field.
    public var rightImageTintColor: Color?
    
    /// Caption text displayed below the text field.
    public var captionText: String?
    
    /// Color of the caption text.
    public var captionColor: Color?
    
    /// Background color of the button associated with the text field.
    public var buttonBackgroundColor: Color?
    
    /// Foreground color of the button associated with the text field.
    public var buttonForegroundColor: Color?
    
    // MARK: - Initialization
    
    /// Initializes a new `RainbowFieldStateAppearanceConfiguration` instance with the provided values.
    ///
    /// - Parameters:
    ///   - borderWidth: The width of the border. Defaults to 2.0.
    ///   - borderColor: The color of the border. Defaults to `lightGray`.
    ///   - leftImageTintColor: The tint color for the left image. Defaults to `lightGray`.
    ///   - rightImageTintColor: The tint color for the right image. Defaults to `lightGray`.
    ///   - captionText: The caption text displayed below the text field. Defaults to `nil`.
    ///   - captionColor: The color of the caption text. Defaults to `lightGray`.
    ///   - buttonBackgroundColor: The background color of the button. Defaults to `.gray.opacity(0.2)`.
    ///   - buttonForegroundColor: The foreground color of the button. Defaults to `.gray`.
    public init(
        borderWidth: CGFloat = 2.0,
        borderColor: Color = RainbowFieldStateAppearanceConfiguration.lightGray,
        leftImageTintColor: Color? = RainbowFieldStateAppearanceConfiguration.lightGray,
        rightImageTintColor: Color? = RainbowFieldStateAppearanceConfiguration.lightGray,
        captionText: String? = nil,
        captionColor: Color? = RainbowFieldStateAppearanceConfiguration.lightGray,
        buttonBackgroundColor: Color? = .gray.opacity(0.2),
        buttonForegroundColor: Color? = .gray
    ) {
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.leftImageTintColor = leftImageTintColor
        self.rightImageTintColor = rightImageTintColor
        self.captionText = captionText
        self.captionColor = captionColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonForegroundColor = buttonForegroundColor
    }
    
    // MARK: - Default Configurations

    /// A default configuration for the text field's idle state.
    ///
    /// This configuration is used when the text field is not focused or interacted with.
    public static var defaultIdleStateAppearanceConfiguration: RainbowFieldStateAppearanceConfiguration {
        return RainbowFieldStateAppearanceConfiguration.Builder()
            .build()
    }
    
    /// A default configuration for the text field's active state.
    ///
    /// This configuration is used when the text field is focused and being interacted with.
    public static var defaultActiveStateAppearanceConfiguration: RainbowFieldStateAppearanceConfiguration {
        return RainbowFieldStateAppearanceConfiguration.Builder()
            .build()
    }
    
    /// A default configuration for the text field's valid state.
    ///
    /// This configuration is used when the text field's input is valid.
    public static var defaultValidStateAppearanceConfiguration: RainbowFieldStateAppearanceConfiguration {
        return RainbowFieldStateAppearanceConfiguration.Builder()
            .build()
    }
    
    /// A default configuration for the text field's invalid state.
    ///
    /// This configuration is used when the text field's input is invalid.
    public static var defaultInvalidStateAppearanceConfiguration: RainbowFieldStateAppearanceConfiguration {
        return RainbowFieldStateAppearanceConfiguration.Builder()
            .build()
    }
}

// MARK: - Builder

public extension RainbowFieldStateAppearanceConfiguration {
    
    /// A builder class for constructing `RainbowFieldStateAppearanceConfiguration` instances.
    /// This class provides a fluent API to set various properties of the configuration.
    class Builder {
        
        // MARK: - Private Properties
        
        private var configuration: RainbowFieldStateAppearanceConfiguration
        
        // MARK: - Initialization
        
        /// Initializes a new `Builder` instance with default values.
        public init() {
            self.configuration = RainbowFieldStateAppearanceConfiguration()
        }
        
        /// Initializes a new `Builder` instance with a given `RainbowFieldStateAppearanceConfiguration`.
        /// This allows the builder to update an existing configuration.
        ///
        /// - Parameter configuration: The existing configuration to update.
        public init(with configuration: RainbowFieldStateAppearanceConfiguration) {
            self.configuration = configuration
        }
        
        // MARK: - Public Methods
        
        /// Sets the width of the border around the text field.
        /// - Parameter width: The border width to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setBorderWidth(_ width: CGFloat) -> Builder {
            configuration.borderWidth = width
            return self
        }
        
        /// Sets the color of the border around the text field.
        /// - Parameter color: The border color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setBorderColor(_ color: Color) -> Builder {
            configuration.borderColor = color
            return self
        }
        
        /// Sets the tint color for the left image in the text field.
        /// - Parameter color: The left image tint color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setLeftImageTintColor(_ color: Color) -> Builder {
            configuration.leftImageTintColor = color
            return self
        }
        
        /// Sets the tint color for the right image in the text field.
        /// - Parameter color: The right image tint color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setRightImageTintColor(_ color: Color) -> Builder {
            configuration.rightImageTintColor = color
            return self
        }
        
        /// Sets the caption text displayed below the text field.
        /// - Parameter text: The caption text to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setCaptionText(_ text: String) -> Builder {
            configuration.captionText = text
            return self
        }
        
        /// Sets the color of the caption text.
        /// - Parameter color: The caption color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setCaptionColor(_ color: Color) -> Builder {
            configuration.captionColor = color
            return self
        }
        
        /// Sets the background color of the button associated with the text field.
        /// - Parameter color: The button background color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setButtonBackgroundColor(_ color: Color) -> Builder {
            configuration.buttonBackgroundColor = color
            return self
        }
        
        /// Sets the foreground color of the button associated with the text field.
        /// - Parameter color: The button foreground color to set.
        /// - Returns: The current `Builder` instance to allow for method chaining.
        public func setButtonForegroundColor(_ color: Color) -> Builder {
            configuration.buttonForegroundColor = color
            return self
        }
        
        /// Builds and returns a `RainbowFieldStateAppearanceConfiguration` instance
        /// using the properties set on the builder.
        /// - Returns: A `RainbowFieldStateAppearanceConfiguration` instance configured with the specified properties.
        public func build() -> RainbowFieldStateAppearanceConfiguration {
            return configuration
        }
    }
}
