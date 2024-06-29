import SwiftUI

/// A configuration struct for customizing the media content of a `RainbowCard`.
public struct RainbowCardMediaConfiguration {
    
    /// An enum representing the type of media content.
    enum MediaType {
        case image(Image)
        case url(URL)
        case localVideo(URL)
        case urlVideo(URL)
    }
    
    /// An enum representing the position of the text overlay on the media content.
    public enum TextPosition {
        case topLeft, topRight, bottomLeft, bottomRight
    }
    
    /// The type of media content.
    let mediaType: MediaType
    
    /// A Boolean indicating whether the media content should loop.
    let shouldLoop: Bool
    
    /// A Boolean indicating whether the media content should auto-play.
    let shouldAutoPlay: Bool
    
    /// An optional gradient overlay for the media content.
    let gradientOverlay: LinearGradient?
    
    /// The title text overlay for the media content.
    let title: String?
    
    /// The subtitle text overlay for the media content.
    let subtitle: String?
    
    /// The position of the text overlay on the media content.
    let textPosition: TextPosition
    
    /// Initializes a new instance of `RainbowCardMediaConfiguration` for image media.
    ///
    /// - Parameters:
    ///   - image: The image to display as the media content.
    ///   - shouldLoop: A Boolean indicating whether the media content should loop. Default is `false`.
    ///   - shouldAutoPlay: A Boolean indicating whether the media content should auto-play. Default is `false`.
    ///   - gradientOverlay: An optional gradient overlay for the media content. Default is `nil`.
    ///   - title: The title text overlay for the media content. Default is `nil`.
    ///   - subtitle: The subtitle text overlay for the media content. Default is `nil`.
    ///   - textPosition: The position of the text overlay on the media content. Default is `.topLeft`.
    public init(image: Image, shouldLoop: Bool = false, shouldAutoPlay: Bool = false, gradientOverlay: LinearGradient? = nil, title: String? = nil, subtitle: String? = nil, textPosition: TextPosition = .topLeft) {
        self.mediaType = .image(image)
        self.shouldLoop = shouldLoop
        self.shouldAutoPlay = shouldAutoPlay
        self.gradientOverlay = gradientOverlay
        self.title = title
        self.subtitle = subtitle
        self.textPosition = textPosition
    }
    
    /// Initializes a new instance of `RainbowCardMediaConfiguration` for URL media.
    ///
    /// - Parameters:
    ///   - url: The URL of the media content.
    ///   - shouldLoop: A Boolean indicating whether the media content should loop. Default is `false`.
    ///   - shouldAutoPlay: A Boolean indicating whether the media content should auto-play. Default is `false`.
    ///   - gradientOverlay: An optional gradient overlay for the media content. Default is `nil`.
    ///   - title: The title text overlay for the media content. Default is `nil`.
    ///   - subtitle: The subtitle text overlay for the media content. Default is `nil`.
    ///   - textPosition: The position of the text overlay on the media content. Default is `.topLeft`.
    public init(url: URL, shouldLoop: Bool = false, shouldAutoPlay: Bool = false, gradientOverlay: LinearGradient? = nil, title: String? = nil, subtitle: String? = nil, textPosition: TextPosition = .topLeft) {
        if url.pathExtension.lowercased() == "mp4" {
            self.mediaType = .urlVideo(url)
        } else {
            self.mediaType = .url(url)
        }
        self.shouldLoop = shouldLoop
        self.shouldAutoPlay = shouldAutoPlay
        self.gradientOverlay = gradientOverlay
        self.title = title
        self.subtitle = subtitle
        self.textPosition = textPosition
    }
    
    /// Initializes a new instance of `RainbowCardMediaConfiguration` for local video media.
    ///
    /// - Parameters:
    ///   - localVideo: The URL of the local video content.
    ///   - shouldLoop: A Boolean indicating whether the media content should loop. Default is `false`.
    ///   - shouldAutoPlay: A Boolean indicating whether the media content should auto-play. Default is `false`.
    ///   - gradientOverlay: An optional gradient overlay for the media content. Default is `nil`.
    ///   - title: The title text overlay for the media content. Default is `nil`.
    ///   - subtitle: The subtitle text overlay for the media content. Default is `nil`.
    ///   - textPosition: The position of the text overlay on the media content. Default is `.topLeft`.
    public init(localVideo: URL, shouldLoop: Bool = false, shouldAutoPlay: Bool = false, gradientOverlay: LinearGradient? = nil, title: String? = nil, subtitle: String? = nil, textPosition: TextPosition = .topLeft) {
        self.mediaType = .localVideo(localVideo)
        self.shouldLoop = shouldLoop
        self.shouldAutoPlay = shouldAutoPlay
        self.gradientOverlay = gradientOverlay
        self.title = title
        self.subtitle = subtitle
        self.textPosition = textPosition
    }
}
