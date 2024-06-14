//
//  RainbowButtonConfigurationBuilder.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import Foundation

/**
 A builder class for creating RainbowButtonConfiguration instances.
 
 This class provides a fluent interface for setting the various options of a RainbowButtonConfiguration.
 */
public class RainbowButtonConfigurationBuilder {
    /**
     The color theme of the button.
     */
    private var theme: RainbowColorTheme = .default
    
    /**
     The border options of the button.
     */
    private var border: RainbowBorderOptions = RainbowBorderOptions()
    
    /**
     The shadow options of the button.
     */
    private var shadow: RainbowShadowOptions = RainbowShadowOptions()
    
    /**
     The corner radius of the button.
     */
    private var cornerRadius: CGFloat = 8
    
    /**
     A Boolean indicating whether the button should have an underline.
     */
    private var underline: Bool = false
    
    /**
     The size of the button.
     */
    private var size: RainbowButtonSize = .normal
    
    /**
     A Boolean indicating whether the button should use a capsule shape.
     */
    private var useCapsuleShape: Bool = false
    
    /**
     Initializes a new instance of RainbowButtonConfigurationBuilder.
     */
    public init() {}
    
    /**
     Sets the color theme of the button.
     
     - Parameter theme: The color theme of the button.
     - Returns: The builder instance.
     */
    public func setTheme(_ theme: RainbowColorTheme) -> RainbowButtonConfigurationBuilder {
        self.theme = theme
        return self
    }
    
    /**
     Sets the border options of the button.
     
     - Parameter options: The border options of the button.
     - Returns: The builder instance.
     */
    public func setBorder(_ options: RainbowBorderOptions) -> RainbowButtonConfigurationBuilder {
        self.border = options
        return self
    }
    
    /**
     Sets the shadow options of the button.
     
     - Parameter options: The shadow options of the button.
     - Returns: The builder instance.
     */
    public func setShadow(_ options: RainbowShadowOptions) -> RainbowButtonConfigurationBuilder {
        self.shadow = options
        return self
    }
    
    /**
     Sets the corner radius of the button.
     
     - Parameter radius: The corner radius of the button.
     - Returns: The builder instance.
     */
    public func setCornerRadius(_ radius: CGFloat) -> RainbowButtonConfigurationBuilder {
        self.cornerRadius = radius
        return self
    }
    
    /**
     Sets whether the button should have an underline.
     
     - Parameter underline: A Boolean indicating whether the button should have an underline.
     - Returns: The builder instance.
     */
    public func setUnderline(_ underline: Bool) -> RainbowButtonConfigurationBuilder {
        self.underline = underline
        return self
    }
    
    /**
     Sets the size of the button.
     
     - Parameter size: The size of the button.
     - Returns: The builder instance.
     */
    public func setSize(_ size: RainbowButtonSize) -> RainbowButtonConfigurationBuilder {
        self.size = size
        return self
    }
    
    /**
     Inverts the color theme of the button.
     
     - Returns: The builder instance.
     */
    public func invertTheme() -> RainbowButtonConfigurationBuilder {
        self.theme = self.theme.inverted()
        return self
    }
    
    /**
     Sets whether the button should use a capsule shape.
     
     - Parameter bool: A Boolean indicating whether the button should use a capsule shape.
     - Returns: The builder instance.
     */
    public func setCapsuleShape(bool: Bool) -> RainbowButtonConfigurationBuilder {
        self.useCapsuleShape = bool
        return self
    }
    
    /**
     Builds a new instance of RainbowButtonConfiguration with the specified options.
     
     - Returns: A new instance of RainbowButtonConfiguration with the specified options.
     */
    public func build() -> RainbowButtonConfiguration {
        return RainbowButtonConfiguration(
            theme: theme,
            border: border,
            shadow: shadow,
            cornerRadius: cornerRadius,
            underline: underline,
            size: size,
            useCapsuleShape: useCapsuleShape
        )
    }
}
