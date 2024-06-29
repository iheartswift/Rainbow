import SwiftUI

/// A configuration struct for customizing the appearance of `RainbowCardContent`.
public struct RainbowCardContentConfiguration {
    
    /// The font of the content text.
    public var font: Font
    
    /// The color of the content text.
    public var textColor: Color
    
    /// The padding for the content text.
    public var padding: EdgeInsets
    
    /// Initializes a new instance of `RainbowCardContentConfiguration` with the specified properties.
    ///
    /// - Parameters:
    ///   - font: The font of the content text. Default is `.body`.
    ///   - textColor: The color of the content text. Default is `.primary`.
    ///   - padding: The padding for the content text. Default is `EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)`.
    public init(
        font: Font = .body,
        textColor: Color = .primary,
        padding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    ) {
        self.font = font
        self.textColor = textColor
        self.padding = padding
    }
}
