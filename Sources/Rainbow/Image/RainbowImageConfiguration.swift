import SwiftUI

/// A configuration struct for customizing the media content of a `RainbowImage`.
public struct RainbowImageConfiguration {
    
    /// The type of media content.
    let source: ImageSource
    
    /// An optional gradient overlay for the image.
    let gradientOverlay: LinearGradient?
    
    public init(source: ImageSource,
                gradientOverlay: LinearGradient? = nil) {
        self.source = source
        self.gradientOverlay = gradientOverlay
    }
    
}
