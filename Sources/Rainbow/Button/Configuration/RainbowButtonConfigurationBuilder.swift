//
//  RainbowButtonConfigurationBuilder.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// A builder class for creating `RainbowButtonConfiguration` instances.
///
/// This class provides a fluent interface for setting the various options of a `RainbowButtonConfiguration`.
public class RainbowButtonConfigurationBuilder {
    /// The color theme of the button.
    private var theme: RainbowColorTheme = .default
    
    /// The font of the button.
    private var font: Font?
    
    /// The border options of the button.
    private var border: RainbowBorderOptions = RainbowBorderOptions()
    
    /// The shadow options of the button.
    private var shadow: RainbowShadowOptions = RainbowShadowOptions()
    
    /// The corner radius of the button.
    private var cornerRadius: CGFloat = 8
    
    /// A Boolean indicating whether the button should have an underline.
    private var underline: Bool = false
    
    /// The size of the button.
    private var size: RainbowButtonSize = .normal
    
    /// The shape type of the button.
    private var shapeType: RainbowButtonShapeType = .roundedRectangle
    
    /// The loader type of the button.
    private var loaderType: RainbowLoaderType = .rainbow
    
    /// The gradient options to apply to the content (text and icon).
    private var contentGradient: RainbowGradientOptions? = nil
    
    /// The gradient options to apply to the background.
    private var backgroundGradient: RainbowGradientOptions? = nil
    
    /// The sound options for the button.
    private var sound: RainbowSoundOptions? = nil
    
    /// The haptic options for the button.
    private var haptic: RainbowHapticOptions? = nil
    
    /// The bounce animation options for the button.
    private var bounce: RainbowBounceAnimationOptions? = nil
    
    /// Initializes a new instance of `RainbowButtonConfigurationBuilder`.
    public init() {}
    
    /// Sets the color theme of the button.
    ///
    /// - Parameter theme: The color theme of the button.
    /// - Returns: The builder instance.
    public func setTheme(_ theme: RainbowColorTheme) -> RainbowButtonConfigurationBuilder {
        self.theme = theme
        return self
    }
    
    /// Sets the font of the button.
    ///
    /// - Parameter font: The font of the button.
    /// - Returns: The builder instance.
    public func setFont(_ font: Font?) -> RainbowButtonConfigurationBuilder {
        self.font = font
        return self
    }
    
    /// Sets the border options of the button.
    ///
    /// - Parameter options: The border options of the button.
    /// - Returns: The builder instance.
    public func setBorder(_ options: RainbowBorderOptions) -> RainbowButtonConfigurationBuilder {
        self.border = options
        return self
    }
    
    /// Sets the shadow options of the button.
    ///
    /// - Parameter options: The shadow options of the button.
    /// - Returns: The builder instance.
    public func setShadow(_ options: RainbowShadowOptions) -> RainbowButtonConfigurationBuilder {
        self.shadow = options
        return self
    }
    
    /// Sets the corner radius of the button.
    ///
    /// - Parameter radius: The corner radius of the button.
    /// - Returns: The builder instance.
    public func setCornerRadius(_ radius: CGFloat) -> RainbowButtonConfigurationBuilder {
        self.cornerRadius = radius
        return self
    }
    
    /// Sets whether the button should have an underline.
    ///
    /// - Parameter underline: A Boolean indicating whether the button should have an underline.
    /// - Returns: The builder instance.
    public func setUnderline(_ underline: Bool) -> RainbowButtonConfigurationBuilder {
        self.underline = underline
        return self
    }
    
    /// Sets the size of the button.
    ///
    /// - Parameter size: The size of the button.
    /// - Returns: The builder instance.
    public func setSize(_ size: RainbowButtonSize) -> RainbowButtonConfigurationBuilder {
        self.size = size
        return self
    }
    
    /// Sets the loader type of the button.
    ///
    /// - Parameter type: The type of loader to display.
    /// - Returns: The builder instance.
    public func setLoader(_ type: RainbowLoaderType = .progress) -> RainbowButtonConfigurationBuilder {
        self.loaderType = type
        return self
    }
    
    /// Sets the gradient options for the content (text and icon).
    ///
    /// - Parameter options: The gradient options to apply to the content.
    /// - Returns: The builder instance.
    public func setContentGradient(_ options: RainbowGradientOptions?) -> RainbowButtonConfigurationBuilder {
        self.contentGradient = options
        return self
    }
    
    /// Sets the gradient options for the background.
    ///
    /// - Parameter options: The gradient options to apply to the background.
    /// - Returns: The builder instance.
    public func setBackgroundGradient(_ options: RainbowGradientOptions?) -> RainbowButtonConfigurationBuilder {
        self.backgroundGradient = options
        return self
    }
    
    /// Sets the sound options for the button.
    ///
    /// - Parameter options: The sound options for the button.
    /// - Returns: The builder instance.
    public func setSound(_ options: RainbowSoundOptions) -> RainbowButtonConfigurationBuilder {
        self.sound = options
        return self
    }
    
    /// Sets the haptic options for the button.
    ///
    /// - Parameter options: The haptic options for the button.
    /// - Returns: The builder instance.
    public func setHaptic(_ options: RainbowHapticOptions) -> RainbowButtonConfigurationBuilder {
        self.haptic = options
        return self
    }
    
    /// Sets the bounce animation options for the button.
    ///
    /// - Parameter options: The bounce animation options for the button.
    /// - Returns: The builder instance.
    public func setBounce(_ options: RainbowBounceAnimationOptions) -> RainbowButtonConfigurationBuilder {
        self.bounce = options
        return self
    }
    
    /// Inverts the color theme of the button.
    ///
    /// - Returns: The builder instance.
    public func invertTheme() -> RainbowButtonConfigurationBuilder {
        self.theme = self.theme.inverted()
        return self
    }
    
    /// Sets the shape type of the button.
    ///
    /// - Parameter type: The shape type of the button.
    /// - Returns: The builder instance.
    public func setShape(type: RainbowButtonShapeType) -> RainbowButtonConfigurationBuilder {
        self.shapeType = type
        return self
    }
    
    /// Builds a new instance of `RainbowButtonConfiguration` with the specified options.
    ///
    /// - Returns: A new instance of `RainbowButtonConfiguration` with the specified options.
    public func build() -> RainbowButtonConfiguration {
        return RainbowButtonConfiguration(
            theme: theme,
            font: font,
            border: border,
            shadow: shadow,
            cornerRadius: shapeType == .rectangle ? 0.0 : cornerRadius,
            underline: underline,
            size: size,
            shapeType: shapeType,
            loaderType: loaderType,
            contentGradient: contentGradient,
            backgroundGradient: backgroundGradient,
            sound: sound,
            haptic: haptic,
            bounce: bounce
        )
    }
}
