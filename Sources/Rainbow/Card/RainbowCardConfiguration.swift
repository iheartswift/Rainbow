import SwiftUI

/// A configuration struct for customizing the appearance and behavior of `RainbowCard` components.
public struct RainbowCardConfiguration {
    
    /// The color theme of the card (supports background only).
    public var backgroundColor: Color
    
    /// The font of the card.
    public var font: Font?
    
    /// The border options of the card.
    public var border: RainbowBorderOptions?
    
    /// The shadow options of the card.
    public var shadow: RainbowShadowOptions
    
    /// The corner radius of the card.
    public var cornerRadius: CGFloat
    
    /// The minimum height of the card.
    public var minHeight: CGFloat
        
    /// Initializes a new instance of `RainbowCardConfiguration`.
    ///
    /// - Parameters:
    ///   - backgroundColor: The background color of the card. Default is `RainbowDefaults.adaptiveColor`.
    ///   - font: The font of the card. Default is `nil`.
    ///   - border: The border options of the card. Default is `RainbowBorderOptions()`.
    ///   - shadow: The shadow options of the card. Default is `.default`.
    ///   - cornerRadius: The corner radius of the card. Default is `RainbowDefaults.cornerRadius`.
    ///   - minHeight: The minimum height of the card. Default is `400`.
    public init(
        backgroundColor: Color = RainbowDefaults.adaptiveColor,
        font: Font? = nil,
        border: RainbowBorderOptions = RainbowBorderOptions(),
        shadow: RainbowShadowOptions = .default,
        cornerRadius: CGFloat = RainbowDefaults.cornerRadius,
        minHeight: CGFloat = 400
    ) {
        self.backgroundColor = backgroundColor
        self.font = font
        self.border = border
        self.shadow = shadow
        self.cornerRadius = cornerRadius
        self.minHeight = minHeight
    }
}
