import Foundation

/// A struct representing animation options for the rainbow border.
public struct RainbowBorderAnimationOptions {
    
    /// The interval for the border animation.
    public var interval: TimeInterval
    
    /// Initializes a new instance of `RainbowBorderAnimationOptions`.
    ///
    /// - Parameter interval: The interval for the border animation.
    public init(interval: TimeInterval) {
        self.interval = interval
    }
}
