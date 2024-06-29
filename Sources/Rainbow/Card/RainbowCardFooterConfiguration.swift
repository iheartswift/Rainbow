import SwiftUI

/// A configuration struct for customizing the footer of a `RainbowCard`.
public struct RainbowCardFooterConfiguration {
    
    /// An enum representing the alignment of the buttons in the footer.
    public enum Alignment {
        case left, right, center, sides
    }
    
    /// A struct representing a button with configuration, optional system image, title, and action.
    public struct RainbowButtonDescription {
        public let configuration: RainbowButtonConfiguration
        public let systemImage: String?
        public let title: String?
        public let action: () -> Void
        
        /// Initializes a new instance of `RainbowButtonDescription`.
        ///
        /// - Parameters:
        ///   - configuration: The configuration for the button.
        ///   - systemImage: An optional system image for the button.
        ///   - title: An optional title for the button.
        ///   - action: The action to perform when the button is pressed.
        public init(configuration: RainbowButtonConfiguration, systemImage: String? = nil, title: String? = nil, action: @escaping () -> Void) {
            self.configuration = configuration
            self.systemImage = systemImage
            self.title = title
            self.action = action
        }
    }
    
    /// The buttons in the footer.
    public let buttons: [RainbowButtonDescription]
    
    /// The alignment of the buttons in the footer.
    public let alignment: Alignment
    
    /// The maximum height of the footer.
    public let maxHeight: CGFloat
    
    /// Initializes a new instance of `RainbowCardFooterConfiguration`.
    ///
    /// - Parameters:
    ///   - buttons: The buttons in the footer.
    ///   - alignment: The alignment of the buttons in the footer. Default is `.center`.
    ///   - maxHeight: The maximum height of the footer. Default is `60.0`.
    public init(buttons: [RainbowButtonDescription], alignment: Alignment = .center, maxHeight: CGFloat = 60.0) {
        self.buttons = buttons
        self.alignment = alignment
        self.maxHeight = maxHeight
    }
}
