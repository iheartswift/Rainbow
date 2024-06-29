import SwiftUI

/// A view representing a pulsating loader.
///
/// This view displays a pulsating loader, with the circle animated in a pulsing manner.
struct RainbowPulsatingLoaderView: View {
    
    /// The configuration for the loader.
    let configuration: RainbowButtonConfiguration
    
    /// A state variable representing the scale of the loader.
    @State private var scale: CGFloat = 1.0
    
    /// The body of the view.
    var body: some View {
        circle
            .frame(width: configuration.size.suggestedHeight, height: configuration.size.suggestedHeight)
            .scaleEffect(scale)
            .animation(
                Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true),
                value: scale
            )
            .onAppear {
                self.scale = 1.5
            }
    }
    
    /// A view representing the circle of the loader.
    @ViewBuilder
    var circle: some View {
        if let contentGradient = configuration.contentGradient {
            Circle()
                .fill(AngularGradient(
                    gradient: .init(
                        colors: contentGradient.colors
                    ),
                    center: .center
                ))
        } else {
            Circle()
                .fill(configuration.theme.foreground)
        }
    }
}
