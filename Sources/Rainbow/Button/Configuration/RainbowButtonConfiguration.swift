//
//  RainbowButtonConfiguration.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI
import UIKit

/**
 A struct representing the configuration options for a Rainbow Button.
 
 A Rainbow Button is a customizable button that can be used in a variety of contexts.
 */
public struct RainbowButtonConfiguration {
    /**
     The color theme of the button.
     */
    public var theme: RainbowColorTheme
    
    /**
     The border options of the button.
     */
    public var border: RainbowBorderOptions
    
    /**
     The shadow options of the button.
     */
    public var shadow: RainbowShadowOptions
    
    /**
     The corner radius of the button.
     */
    public var cornerRadius: CGFloat
    
    /**
     A Boolean indicating whether the button should have an underline.
     */
    public var underline: Bool
    
    /**
     The size of the button.
     */
    public var size: RainbowButtonSize
    
    /**
     A Boolean indicating whether the button should use a capsule shape.
     */
    public var useCapsuleShape: Bool
    
    /**
     Initializes a new instance of RainbowButtonConfiguration with the specified options.
     
     - Parameters:
       - theme: The color theme of the button. Default is `.primary`.
       - border: The border options of the button. Default is `RainbowBorderOptions()`.
       - shadow: The shadow options of the button. Default is `RainbowShadowOptions()`.
       - cornerRadius: The corner radius of the button. Default is `8`.
       - underline: A Boolean indicating whether the button should have an underline. Default is `false`.
       - size: The size of the button. Default is `.normal`.
       - useCapsuleShape: A Boolean indicating whether the button should use a capsule shape. Default is `false`.
     */
    public init(
        theme: RainbowColorTheme = .primary,
        border: RainbowBorderOptions = RainbowBorderOptions(),
        shadow: RainbowShadowOptions = RainbowShadowOptions(),
        cornerRadius: CGFloat = 8,
        underline: Bool = false,
        size: RainbowButtonSize = .normal,
        useCapsuleShape: Bool = false
    ) {
        self.theme = theme
        self.border = border
        self.shadow = shadow
        self.cornerRadius = cornerRadius
        self.underline = underline
        self.size = size
        self.useCapsuleShape = useCapsuleShape
    }
    
    /**
     Returns a new instance of RainbowButtonConfiguration with the theme inverted.
     
     - Returns: A new instance of RainbowButtonConfiguration with the theme inverted.
     */
    public func invertTheme() -> RainbowButtonConfiguration {
        var c = self
        c.theme = c.theme.inverted()
        return c
    }
    
    /**
     Returns a new instance of RainbowButtonConfiguration with the useCapsuleShape option set to true.
     
     - Returns: A new instance of RainbowButtonConfiguration with the useCapsuleShape option set to true.
     */
    public func capsule() -> RainbowButtonConfiguration {
        var c = self
        c.useCapsuleShape = true
        return c
    }
    
    /**
     Returns a new instance of RainbowButtonConfiguration with the specified size.
     
     - Parameter size: The new size of the button.
     - Returns: A new instance of RainbowButtonConfiguration with the specified size.
     */
    public func update(_ size: RainbowButtonSize) -> RainbowButtonConfiguration {
        var c = self
        c.size = size
        return c
    }
}

/**
 Extensions to the RainbowButtonConfiguration type to provide various pre-defined configurations.
 */
extension RainbowButtonConfiguration {
    /**
     Creates an outlined button configuration with the specified theme.
     
     - Parameter theme: The theme for the outlined button.
     - Returns: An outlined button configuration with the specified theme.
     */
    public static func outlined(_ theme: RainbowColorTheme) -> RainbowButtonConfiguration {
        let backingTheme = RainbowColorTheme.outlined(theme: theme)
        return RainbowButtonConfigurationBuilder()
            .setTheme(backingTheme)
            .setBorder(RainbowBorderOptions(color: backingTheme.foreground, width: 2))
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    /**
     The default button configuration.
     */
    public static var `default`: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.default)
            .setCornerRadius(8)
            .setUnderline(false)
            .setBorder(RainbowBorderOptions(color: Color(UIColor.label).opacity(0.2), width: 1.0))
            .build()
    }
    
    /**
     Various pre-defined button configurations.
     */
    public static var white: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.white)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var light: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.light)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var dark: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.dark)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var black: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.black)
            .setCornerRadius(8)
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
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.primaryLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var primaryInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.primary)
            .invertTheme()
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var link: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.link)
            .setCornerRadius(8)
            .setUnderline(false)
            .setCapsuleShape(bool: true)
            .build()
    }
    
    public static var linkLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.linkLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var linkInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.link)
            .setCornerRadius(8)
            .setUnderline(false)
            .invertTheme()
            .build()
    }

    public static var info: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.info)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var infoLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.infoLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var infoInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.info)
            .invertTheme()
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var success: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.success)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var successLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.successLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var successInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.success)
            .invertTheme()
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var warning: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warning)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var warningLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warningLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var warningInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.warning)
            .invertTheme()
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }

    public static var danger: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.danger)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerLight: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.dangerLight)
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
    
    public static var dangerInverted: RainbowButtonConfiguration {
        RainbowButtonConfigurationBuilder()
            .setTheme(.danger)
            .invertTheme()
            .setCornerRadius(8)
            .setUnderline(false)
            .build()
    }
}
