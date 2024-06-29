import SwiftUI

/// A view that displays text content within a card, styled according to the provided configuration.
public struct RainbowCardContent: View {
    
    /// The text content to display.
    let content: String
    
    /// The configuration for the content's appearance.
    let configuration: RainbowCardContentConfiguration
    
    /// Initializes a new instance of `RainbowCardContent`.
    ///
    /// - Parameters:
    ///   - content: The text content to display.
    ///   - configuration: The configuration for the content's appearance. Default is `RainbowCardContentConfiguration()`.
    public init(content: String, configuration: RainbowCardContentConfiguration = RainbowCardContentConfiguration()) {
        self.content = content
        self.configuration = configuration
    }
    
    /// The body of the content view.
    public var body: some View {
        Text(content)
            .font(configuration.font)
            .foregroundColor(configuration.textColor)
            .padding(configuration.padding)
    }
}
