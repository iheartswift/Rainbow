import SwiftUI

public struct RainbowImage: View {
    
    private let configuration: RainbowImageConfiguration
    
    /// Creates a new `RainbowImage` from the given `source`.
    /// - Parameter source: the source of the image
    public init(source: ImageSource) {
        self.configuration = .init(source: source)
    }
    
    /// Creates a new `RainbowImage` from the given `RainbowImageConfiguration`.
    /// - Parameter configuration: the configuration of the image
    public init(configuration: RainbowImageConfiguration) {
        self.configuration = configuration
    }

    public var body: some View {
        ZStack {
            self.buildImage()
            
            if let overlay = configuration.gradientOverlay {
                overlay
            }
        }
    }

    @ViewBuilder
    private func buildImage() -> some View {
        switch self.configuration.source {
        case .disk(let name, let bundle):
            Image(name, bundle: bundle)
                .resizable()
        case .system(let name):
            Image(systemName: name)
                .resizable()
        case .url(let url):
            RemoteImage(url: url)
        }
    }
}
