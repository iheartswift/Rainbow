//
//  RainbowButtonConfiguration.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

public struct RainbowButtonConfiguration {
    
    /// The color theme of the button.
    public var theme: RainbowColorTheme
    
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
    public var shapeType: RainbowButtonShapeType
    
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
        theme: RainbowColorTheme = .primary,
        font: Font? = nil,
        border: RainbowBorderOptions = RainbowBorderOptions(),
        shadow: RainbowShadowOptions = RainbowShadowOptions(),
        cornerRadius: CGFloat = 8,
        underline: Bool = false,
        size: RainbowButtonSize = .normal,
        shapeType: RainbowButtonShapeType = .roundedRectangle,
        loaderType: RainbowLoaderType = .progress,
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

extension RainbowButtonConfiguration {

    /// The default corner radius for the button.
    public static var defaultCornerRadius: CGFloat = 8.0
}

/// Extensions to the `RainbowButtonConfiguration` type to provide various pre-defined configurations.
extension RainbowButtonConfiguration {
    
    /// Creates a `RainbowButtonConfiguration` with a rainbow theme.
    ///
    /// - Parameters:
    ///   - shapeType: The shape type of the button.
    ///   - colors: The colors to use for the rainbow effect. Default is `[.yellow, .green, .blue, .red, .purple, .orange]`.
    ///   - borderWidth: The width of the button's border. Default is `5.0`.
    ///   - animationInterval: The interval for the border animation. Default is `0.5`.
    /// - Returns: A `RainbowButtonConfiguration` with the specified rainbow theme.
    public static func rainbow(
        shapeType: RainbowButtonShapeType,
        colors: [Color] = [.yellow, .green, .blue, .red, .purple, .orange],
        borderWidth: CGFloat = 5.0,
        animationInterval: TimeInterval = 0.5
    ) -> RainbowButtonConfiguration {
        return RainbowButtonConfigurationBuilder()
            .setShape(type: shapeType)
            .setLoader(.rainbow)
            .setTheme(RainbowColorTheme(background: .black, foreground: .clear, selected: .yellow.opacity(0.3)))
            .setBorder(RainbowBorderOptions(
                    colors: colors,
                    width: borderWidth,
                    animationOptions: RainbowBorderAnimationOptions(interval: animationInterval)
                )
            )
            .setContentGradient(RainbowGradientOptions(colors: colors))
            .build()
    }
    
    /// Creates an outlined button configuration with the specified theme.
    ///
    /// - Parameter theme: The theme for the outlined button.
    /// - Returns: An outlined button configuration with the specified theme.
    public static func outlined(_ theme: RainbowColorTheme) -> RainbowButtonConfiguration {
        let backingTheme = RainbowColorTheme.outlined(theme: theme)
        return RainbowButtonConfigurationBuilder()
            .setTheme(backingTheme)
            .setBorder(RainbowBorderOptions(colors: [backingTheme.foreground], width: 2))
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .setBounce(.moderate)
            .build()
    }
    
    /// A default builder for `RainbowButtonConfiguration`.
    public static var defaultBuilder: RainbowButtonConfigurationBuilder {
        RainbowButtonConfigurationBuilder()
            .setTheme(.default)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .setBorder(RainbowBorderOptions(colors: [RainbowColorTheme.default.foreground.opacity(0.2)], width: 1.0))
    }
    
    /// The default button configuration.
    public static var `default`: RainbowButtonConfiguration {
       defaultBuilder
            .setBounce(.moderate)
            .build()
    }
    
    /// Creates a default button configuration with the specified size.
    ///
    /// - Parameter size: The size of the button.
    /// - Returns: A default button configuration with the specified size.
    public static func defaultButton(_ size: RainbowButtonSize) -> RainbowButtonConfiguration {
        defaultBuilder
            .setSize(size)
            .build()
    }
    
    /// Creates a button configuration with the specified parameters.
    ///
    /// - Parameters:
    ///   - configuration: The base configuration for the button.
    ///   - shape: The shape type of the button.
    ///   - size: The size of the button. Default is `.extraLarge`.
    /// - Returns: A button configuration with the specified parameters.
    public static func button(
        _ configuration: RainbowButtonConfiguration,
        _ shape: RainbowButtonShapeType,
        _ size: RainbowButtonSize = .extraLarge
    ) -> RainbowButtonConfiguration {
        var c = configuration
        c.size = size
        c.shapeType = shape
        return c
    }
    
    /// Various pre-defined button configurations.
    public static var white: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.white)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var light: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.light)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var dark: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.dark)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var black: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.black)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var text: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.text)
            .setCornerRadius(0)
            .setUnderline(true)
            .build()
    }

    public static var ghost: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.ghost)
            .setCornerRadius(0)
            .setUnderline(false)
            .build()
    }

    public static var primary: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.primary)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.primaryLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.primary)
            .setFont(.largeTitle)
            .invertTheme()
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var link: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.link)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var linkLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.linkLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var linkInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.link)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .invertTheme()
            .build()
    }

    public static var info: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.info)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var infoLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.infoLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var infoInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.info)
            .invertTheme()
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var success: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.success)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var successLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.successLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var successInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.success)
            .invertTheme()
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var warning: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warning)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var warningLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warningLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var warningInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warning)
            .invertTheme()
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }

    public static var danger: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.danger)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.dangerLight)
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.danger)
            .invertTheme()
            .setCornerRadius(RainbowButtonConfiguration.defaultCornerRadius)
            .setUnderline(false)
            .build()
    }
}
