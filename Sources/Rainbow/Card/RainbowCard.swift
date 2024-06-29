import SwiftUI
#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// A customizable card view that supports various content sections and configurations.
public struct RainbowCard<HeaderContent: View, MediaContent: View, CardContent: View, FooterContent: View>: View {
    
    /// The content for the header section of the card.
    let headerContent: HeaderContent?
    
    /// The content for the media section of the card.
    let mediaContent: MediaContent?
    
    /// The content for the main section of the card.
    let cardContent: CardContent?
    
    /// The content for the footer section of the card.
    let footerContent: FooterContent?
    
    /// The configuration for the card.
    let configuration: RainbowCardConfiguration
    
    /// State to track focus on tvOS.
    @State private var isFocused: Bool = false
    
    /// Initializes a new instance of `RainbowCard`.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the card. Default is `RainbowCardConfiguration()`.
    ///   - headerContent: The content for the header section of the card. Default is `EmptyView()`.
    ///   - mediaContent: The content for the media section of the card. Default is `EmptyView()`.
    ///   - cardContent: The content for the main section of the card. Default is `EmptyView()`.
    ///   - footerContent: The content for the footer section of the card. Default is `EmptyView()`.
    public init(
        configuration: RainbowCardConfiguration = RainbowCardConfiguration(),
        headerContent: HeaderContent = EmptyView(),
        mediaContent: MediaContent = EmptyView(),
        cardContent: CardContent = EmptyView(),
        footerContent: FooterContent = EmptyView()
    ) {
        self.configuration = configuration
        self.headerContent = headerContent
        self.mediaContent = mediaContent
        self.cardContent = cardContent
        self.footerContent = footerContent
    }
    
    /// The body of the card view.
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let headerContent = headerContent {
                headerContent
            }
            
            if let mediaContent = mediaContent {
                mediaContent
                    .frame(maxWidth: .infinity)
            }
            
            if let cardContent = cardContent {
                cardContent
            }
                        
            if let footerContent = footerContent {
                footerContent
            }
        }
        .background(configuration.backgroundColor)
        .cornerRadius(configuration.cornerRadius)
        .overlay(borderOverlay)
        .clipped()
        .shadow(
            color: configuration.shadow.color,
            radius: configuration.shadow.radius,
            x: configuration.shadow.x,
            y: configuration.shadow.y
        )
        .scaleEffect(isFocused ? 1.02 : 1)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
        #if os(tvOS)
        .focusable(true) { newState in
            isFocused = newState
        }
        #endif
    }
    
    /// A view that represents the border overlay of the card.
    @ViewBuilder
    private var borderOverlay: some View {
        if let borderOptions = configuration.border {
            RoundedRectangle(cornerRadius: configuration.cornerRadius)
                .strokeBorder(
                    LinearGradient(colors: borderOptions.colors, startPoint: .topLeading, endPoint: .bottomTrailing),
                    style: StrokeStyle(lineWidth: borderOptions.width, dash: borderOptions.dashPattern)
                )
        }
    }
}




