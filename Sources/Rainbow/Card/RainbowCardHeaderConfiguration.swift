import SwiftUI

/// A struct representing configuration options for the `RainbowCardHeader`.
public struct RainbowCardHeaderConfiguration {
    
    /// The font of the title.
    public var titleFont: Font
    
    /// The color of the title.
    public var titleColor: Color
    
    /// The font of the subtitle.
    public var subtitleFont: Font
    
    /// The color of the subtitle.
    public var subtitleColor: Color
    
    /// The padding for the title.
    public var titlePadding: EdgeInsets
    
    /// The padding for the subtitle.
    public var subtitlePadding: EdgeInsets
    
    /// The maximum height of the header.
    public var maxHeight: CGFloat = 80
    
    /// The configuration for the button in the header.
    public var buttonConfiguration: RainbowButtonConfiguration
        
    /// Initializes a new instance of `RainbowCardHeaderConfiguration` with the specified text properties.
    ///
    /// - Parameters:
    ///   - titleFont: The font of the title. Default is `.headline`.
    ///   - titleColor: The color of the title. Default is `.primary`.
    ///   - subtitleFont: The font of the subtitle. Default is `.subheadline`.
    ///   - subtitleColor: The color of the subtitle. Default is `.secondary`.
    ///   - titlePadding: The padding for the title. Default is `EdgeInsets(top: 10, leading: 0, bottom: 2, trailing: 0)`.
    ///   - subtitlePadding: The padding for the subtitle. Default is `EdgeInsets()`.
    ///   - buttonConfiguration: The configuration for the button in the header. Default is `.default`.
    public init(
        titleFont: Font = .headline,
        titleColor: Color = .primary,
        subtitleFont: Font = .subheadline,
        subtitleColor: Color = .secondary,
        titlePadding: EdgeInsets = EdgeInsets(top: 10, leading: 0, bottom: 2, trailing: 0),
        subtitlePadding: EdgeInsets = EdgeInsets(),
        buttonConfiguration: RainbowButtonConfiguration = .default
    ) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.subtitleFont = subtitleFont
        self.subtitleColor = subtitleColor
        self.titlePadding = titlePadding
        self.subtitlePadding = subtitlePadding
        self.buttonConfiguration = buttonConfiguration
    }
}
