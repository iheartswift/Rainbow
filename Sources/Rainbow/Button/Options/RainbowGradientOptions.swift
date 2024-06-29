import SwiftUI

/// A struct representing options for a rainbow content gradient.
///
/// A rainbow content gradient is a gradient that can be applied to the text and icons within a view.
public struct RainbowGradientOptions {
    /// The colors of the gradient.
    public var colors: [Color]
    
    /// The start point of the gradient.
    public var startPoint: UnitPoint
    
    /// The end point of the gradient.
    public var endPoint: UnitPoint
    
    /// Initializes a new instance of `RainbowGradientOptions` with the specified colors, start point, and end point.
    ///
    /// - Parameters:
    ///   - colors: The colors of the gradient. Default is an array containing `.clear`.
    ///   - startPoint: The start point of the gradient. Default is `.leading`.
    ///   - endPoint: The end point of the gradient. Default is `.trailing`.
    public init(colors: [Color] = [.clear], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    /// Returns a `LinearGradient` using the specified options.
    ///
    /// - Returns: A `LinearGradient`.
    public var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
    }
}
