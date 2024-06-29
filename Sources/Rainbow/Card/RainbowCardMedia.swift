import SwiftUI
#if !os(watchOS)
import AVKit
#endif

public struct RainbowCardMedia: View {
    
    let configuration: RainbowCardMediaConfiguration
    
    public init(configuration: RainbowCardMediaConfiguration) {
        self.configuration = configuration
    }
    
    public var body: some View {
        ZStack {
            switch configuration.mediaType {
            case .image(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    
            case .url(let url):
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            Spacer()
                        }
                    case .success(let image):
                        GeometryReader { reader in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: reader.size.width)
                                .clipped()
                        }
                    case .failure:
                        Image(systemName: "xmark.circle")
                    @unknown default:
                        ProgressView()
                    }
                }
                
            case .localVideo(let url), .urlVideo(let url):
                #if os(watchOS)
                Image(systemName: "play.circle")
                #else
                VideoPlayer(player: getPlayer(for: url))
                    .clipped()
                    .onAppear {
                        if configuration.shouldAutoPlay {
                            getPlayer(for: url).play()
                        }
                    }
                #endif
            }
            
            if let overlay = configuration.gradientOverlay {
                overlay
            }
            
            if let title = configuration.title, let subtitle = configuration.subtitle {
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height, alignment: alignmentForText(configuration.textPosition))
                }
            }
        }
    }
    
    private func alignmentForText(_ position: RainbowCardMediaConfiguration.TextPosition) -> Alignment {
        switch position {
        case .topLeft:
            return .topLeading
        case .topRight:
            return .topTrailing
        case .bottomLeft:
            return .bottomLeading
        case .bottomRight:
            return .bottomTrailing
        }
    }
    
    #if !os(watchOS)
    private func getPlayer(for url: URL) -> AVPlayer {
        let player = AVQueuePlayer(url: url)
        if configuration.shouldLoop {
            _ = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: AVAsset(url: url)))
        }
        if configuration.shouldAutoPlay {
            player.play()
        }
        return player
    }
    #endif
}


