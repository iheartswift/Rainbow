import SwiftUI

/// A struct representing options for a rainbow border.
///
/// A rainbow border is a border that can be applied to a view, with specified colors and width.
public struct RainbowBorderOptions {
    
    /// The colors of the border.
    public var colors: [Color]
    
    /// The width of the border.
    public var width: CGFloat
    
    /// The dash pattern for the border.
    public var dashPattern: [CGFloat]
    
    /// The animation options for the border.
    public var animationOptions: RainbowBorderAnimationOptions?
    
    /// Initializes a new instance of `RainbowBorderOptions` with the specified colors, width, dash pattern, and animation options.
    ///
    /// - Parameters:
    ///   - colors: The colors of the border. Default is an array containing `.clear`.
    ///   - width: The width of the border. Default is `2.0`.
    ///   - dashPattern: The dash pattern for the border. Default is an empty array.
    ///   - animationOptions: The animation options for the border. Default is `nil`.
    public init(colors: [Color] = [.clear], width: CGFloat = 0.0, dashPattern: [CGFloat] = [], animationOptions: RainbowBorderAnimationOptions? = nil) {
        self.colors = colors
        self.width = width
        self.dashPattern = dashPattern
        self.animationOptions = animationOptions
    }
}
