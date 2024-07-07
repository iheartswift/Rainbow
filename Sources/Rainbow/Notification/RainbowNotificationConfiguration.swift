import SwiftUI

/// A struct representing the configuration of a rainbow notification.
public struct RainbowNotificationConfiguration {
    /// The corner radius of the notification.
    public let cornerRadius: CGFloat
    
    /// The font used in the notification.
    public let font: Font
    
    /// The color theme of the notification.
    public let theme: RainbowColorTheme
    
    /// The border options of the notification.
    public let borderOptions: RainbowBorderOptions
    
    /// The shadow options of the notification.
    public let shadowOptions: RainbowShadowOptions
    
    /// Initializes a new instance of `RainbowNotificationConfiguration`.
    ///
    /// - Parameters:
    ///   - cornerRadius: The corner radius of the notification. Default is `RainbowDefaults.cornerRadius`.
    ///   - font: The font used in the notification. Default is `.body`.
    ///   - theme: The color theme of the notification. Default is `.primary`.
    ///   - borderOptions: The border options of the notification. Default is `RainbowBorderOptions()`.
    ///   - shadowOptions: The shadow options of the notification. Default is `RainbowShadowOptions()`.
    public init(
        cornerRadius: CGFloat = RainbowDefaults.cornerRadius,
        font: Font = .body,
        theme: RainbowColorTheme = .primary,
        borderOptions: RainbowBorderOptions = RainbowBorderOptions(),
        shadowOptions: RainbowShadowOptions = RainbowShadowOptions()
    ) {
        self.cornerRadius = cornerRadius
        self.font = font
        self.theme = theme
        self.borderOptions = borderOptions
        self.shadowOptions = shadowOptions
    }
}

public extension RainbowNotificationConfiguration {
    
    /// The primary color theme configuration.
    static var primary: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .primary)
    }
    
    /// The link color theme configuration.
    static var link: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .link)
    }
    
    /// The info color theme configuration.
    static var info: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .info)
    }
    
    /// The success color theme configuration.
    static var success: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .success)
    }
    
    /// The warning color theme configuration.
    static var warning: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .warning)
    }
    
    /// The danger color theme configuration.
    static var danger: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .danger)
    }
    
    /// The primary light color theme configuration.
    static var primaryLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .primaryLight)
    }
    
    /// The link light color theme configuration.
    static var linkLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .linkLight)
    }
    
    /// The info light color theme configuration.
    static var infoLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .infoLight)
    }
    
    /// The success light color theme configuration.
    static var successLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .successLight)
    }
    
    /// The warning light color theme configuration.
    static var warningLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .warningLight)
    }
    
    /// The danger light color theme configuration.
    static var dangerLight: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(theme: .dangerLight)
    }
    
    /// The outline primary color theme configuration.
    static var outlinePrimary: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlinePrimary.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlinePrimary.foreground], width: 2.0)
        )
    }

    /// The outline link color theme configuration.
    static var outlineLink: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlineLink.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlineLink.foreground], width: 2.0)
        )
    }

    /// The outline info color theme configuration.
    static var outlineInfo: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlineInfo.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlineInfo.foreground], width: 2.0)
        )
    }

    /// The outline success color theme configuration.
    static var outlineSuccess: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlineSuccess.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlineSuccess.foreground], width: 2.0)
        )
    }

    /// The outline warning color theme configuration.
    static var outlineWarning: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlineWarning.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlineWarning.foreground], width: 2.0)
        )
    }

    /// The outline danger color theme configuration.
    static var outlineDanger: RainbowNotificationConfiguration {
        return RainbowNotificationConfiguration(
            theme: RainbowColorTheme(background: .clear, foreground: RainbowColorTheme.outlineDanger.foreground),
            borderOptions: RainbowBorderOptions(colors: [RainbowColorTheme.outlineDanger.foreground], width: 2.0)
        )
    }
}
