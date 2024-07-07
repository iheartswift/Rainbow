import SwiftUI

/// A protocol representing a basic color theme for Rainbow components.
public protocol RainbowBaseColorTheme: Equatable, Hashable {
    
    /// The background color of the theme.
    var background: Color { get }
    
    /// The foreground color of the theme.
    var foreground: Color { get }
}
