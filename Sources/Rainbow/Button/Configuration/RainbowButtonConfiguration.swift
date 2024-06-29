import SwiftUI

public struct RainbowButtonConfiguration {
    
    /// The color theme of the button.
    public var theme: RainbowButtonColorTheme
    
    /// The font of the button.
    public var font: Font?
    
    /// The border options of the button.
    public var border: RainbowBorderOptions
    
    /// The shadow options of the button.
    public var shadow: RainbowShadowOptions
    
    /// The corner radius of the button.
    public var cornerRadius: CGFloat
    
    /// A Boolean indicating whether the button should have an underline.
    public var underline: Bool
    
    /// The size of the button.
    public var size: RainbowButtonSize
    
    /// A Boolean indicating whether the button should use a capsule shape.
    public var shapeType: RainbowShapeType
    
    /// The type of loader to display.
    public var loaderType: RainbowLoaderType
    
    /// The gradient to apply to the content (text and icon).
    public var contentGradient: RainbowGradientOptions?
    
    /// The gradient to apply to the background.
    public var backgroundGradient: RainbowGradientOptions?
    
    /// The sound options for the button.
    public var sound: RainbowSoundOptions?
    
    /// The haptic options for the button.
    public var haptic: RainbowHapticOptions?
    
    /// The bounce animation options for the button.
    public var bounce: RainbowBounceAnimationOptions?
    
    /// The focused values for tvOS
    public var focused: RainbowFocusedOptions
    
    /**
     Initializes a new instance of RainbowButtonConfiguration with the specified options.
     
     - Parameters:
       - theme: The color theme of the button. Default is `.primary`.
       - font: The font of the button. Default is `nil`.
       - border: The border options of the button. Default is `RainbowBorderOptions()`.
       - shadow: The shadow options of the button. Default is `RainbowShadowOptions()`.
       - cornerRadius: The corner radius of the button. Default is `8`.
       - underline: A Boolean indicating whether the button should have an underline. Default is `false`.
       - size: The size of the button. Default is `.normal`.
       - shapeType: A Boolean indicating whether the button should use a capsule shape. Default is `.roundedRectangle`.
       - loaderType: The kind of loader to display if @State variable isLoading is active. Default is `.progress`.
       - contentGradient: The gradient to apply to the content (text and icon). Default is `nil`.
       - backgroundGradient: The gradient to apply to the background. Default is `nil`.
       - sound: The sound options for the button. Default is `nil`.
       - haptic: The haptic options for the button. Default is `nil`.
       - bounce: The bounce animation options for the button. Default is `nil`.
       - focused: The focus styling options for the button when @FocusState isFocused is true. Default is `nil`
     */
    public init(
        theme: RainbowButtonColorTheme = .default,
        font: Font? = nil,
        border: RainbowBorderOptions = RainbowBorderOptions(),
        shadow: RainbowShadowOptions = RainbowShadowOptions(),
        cornerRadius: CGFloat = RainbowDefaults.cornerRadius,
        underline: Bool = false,
        size: RainbowButtonSize = .normal,
        shapeType: RainbowShapeType = .roundedRectangle(),
        loaderType: RainbowLoaderType = .rainbow,
        contentGradient: RainbowGradientOptions? = nil,
        backgroundGradient: RainbowGradientOptions? = nil,
        sound: RainbowSoundOptions? = nil,
        haptic: RainbowHapticOptions? = nil,
        bounce: RainbowBounceAnimationOptions? = nil,
        focused: RainbowFocusedOptions = RainbowFocusedOptions()
    ) {
        self.theme = theme
        self.font = font
        self.border = border
        self.shadow = shadow
        self.cornerRadius = cornerRadius
        self.underline = underline
        self.size = size
        self.shapeType = shapeType
        self.loaderType = loaderType
        self.contentGradient = contentGradient
        self.backgroundGradient = backgroundGradient
        self.sound = sound
        self.haptic = haptic
        self.bounce = bounce
        self.focused = focused
    }
    
    /// Inverts the color theme of the button configuration.
    /// - Returns: A new instance of `RainbowButtonConfiguration` with the inverted color theme.
    public func invertTheme() -> RainbowButtonConfiguration {
        var c = self
        c.theme = c.theme.inverted()
        return c
    }
    
    /// Updates the size of the button.
    /// - Parameter size: The new size for the button.
    /// - Returns: A new instance of `RainbowButtonConfiguration` with the updated size.
    public func update(_ size: RainbowButtonSize) -> RainbowButtonConfiguration {
        var c = self
        c.size = size
        return c
    }
}

/// Extensions to the `RainbowButtonConfiguration` type to provide various pre-defined configurations.
extension RainbowButtonConfiguration {
    
    /// Creates a button configuration with the specified parameters.
    ///
    /// - Parameters:
    ///   - configuration: The base configuration for the button.
    ///   - shape: The shape type of the button.
    ///   - size: The size of the button. Default is `.extraLarge`.
    /// - Returns: A button configuration with the specified parameters.
    public static func configure(
        _ configuration: RainbowButtonConfiguration,
        _ shape: RainbowShapeType,
        _ size: RainbowButtonSize = .extraLarge
    ) -> RainbowButtonConfiguration {
        var c = configuration
        c.size = size
        c.shapeType = shape
        return c
    }
        
    /// Various pre-defined button configurations.
    public static var `default`: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.default)
            .setUnderline(false)
            .setBorder(RainbowBorderOptions(colors: [RainbowButtonColorTheme.default.foreground.opacity(0.2)], width: 1.0))
            .setBounce(.moderate)
            .build()
    }
    
    public static var white: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.white)
            .setUnderline(false)
            .build()
    }

    public static var light: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.light)
            .setUnderline(false)
            .build()
    }

    public static var dark: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.dark)
            .setUnderline(false)
            .build()
    }

    public static var black: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.black)
            .setUnderline(false)
            .build()
    }

    public static var text: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.text)
            .setUnderline(true)
            .build()
    }

    public static var ghost: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.ghost)
            .setUnderline(false)
            .build()
    }

    public static var primary: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.primary)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.primaryLight)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.primary)
            .setFont(.largeTitle)
            .invertTheme()
            .setUnderline(false)
            .build()
    }

    public static var link: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.link)
            .setUnderline(false)
            .build()
    }
    
    public static var linkLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.linkLight)
            .setUnderline(false)
            .build()
    }
    
    public static var linkInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.link)
            .setUnderline(false)
            .invertTheme()
            .build()
    }

    public static var info: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.info)
            .setUnderline(false)
            .build()
    }
    
    public static var infoLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.infoLight)
            .setUnderline(false)
            .build()
    }
    
    public static var infoInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.info)
            .invertTheme()
            .setUnderline(false)
            .build()
    }

    public static var success: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.success)
            .setUnderline(false)
            .build()
    }
    
    public static var successLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.successLight)
            .setUnderline(false)
            .build()
    }
    
    public static var successInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.success)
            .invertTheme()
            .setUnderline(false)
            .build()
    }

    public static var warning: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.warning)
            .setUnderline(false)
            .build()
    }
    
    public static var warningLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.warningLight)
            .setUnderline(false)
            .build()
    }
    
    public static var warningInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.warning)
            .invertTheme()
            .setUnderline(false)
            .build()
    }

    public static var danger: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.danger)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerLight: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.dangerLight)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerInverted: RainbowButtonConfiguration {
        RainbowButtonConfiguration.Builder()
            .setTheme(.danger)
            .invertTheme()
            .setUnderline(false)
            .build()
    }
    
    /// Creates an outlined button configuration with the specified theme.
    ///
    /// - Parameter theme: The theme for the outlined button.
    /// - Returns: An outlined button configuration with the specified theme.
    public static func outlined(_ theme: RainbowButtonColorTheme) -> RainbowButtonConfiguration {
        let backingTheme = RainbowButtonColorTheme.outlined(theme: theme)
        return RainbowButtonConfiguration.Builder()
            .setTheme(backingTheme)
            .setBorder(RainbowBorderOptions(colors: [backingTheme.foreground], width: 2))
            .setShape(type: .roundedRectangle())
            .setUnderline(false)
            .setBounce(.moderate)
            .build()
    }
    
    /// Creates a `RainbowButtonConfiguration` with a rainbow theme.
    ///
    /// - Parameters:
    ///   - shapeType: The shape type of the button.
    ///   - colors: The colors to use for the rainbow effect. Default is `[.yellow, .green, .blue, .red, .purple, .orange]`.
    ///   - borderWidth: The width of the button's border. Default is `5.0`.
    ///   - animationInterval: The interval for the border animation. Default is `0.5`.
    /// - Returns: A `RainbowButtonConfiguration` with the specified rainbow theme.
    public static func rainbow(
        shapeType: RainbowShapeType,
        colors: [Color] = [.yellow, .green, .blue, .red, .purple, .orange],
        borderWidth: CGFloat = 5.0,
        animationInterval: TimeInterval = 0.5
    ) -> RainbowButtonConfiguration {
        return RainbowButtonConfiguration.Builder()
            .setShape(type: shapeType)
            .setLoader(.rainbow)
            .setTheme(RainbowButtonColorTheme(background: .black, foreground: .clear, selected: .yellow.opacity(0.3)))
            .setBorder(RainbowBorderOptions(
                    colors: colors,
                    width: borderWidth,
                    animationOptions: RainbowBorderAnimationOptions(interval: animationInterval)
                )
            )
            .setContentGradient(RainbowGradientOptions(colors: colors))
            .build()
    }
}
