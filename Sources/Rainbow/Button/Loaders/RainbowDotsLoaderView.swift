import SwiftUI

/// A view representing a dots loader.
///
/// This view displays a dots loader, with the dots animated in a pulsing manner.
struct RainbowDotsLoaderView: View {
    /// The configuration for the loader.
    let configuration: RainbowButtonConfiguration
    
    /// A state variable indicating whether the loader is animating.
    @State private var isAnimating = false
    
    /// The body of the view.
    var body: some View {
        HStack(spacing: 5) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(fillColor)
                    .frame(
                        width: configuration.size.suggestedHeight / 3,
                        height: configuration.size.suggestedHeight / 3
                    )
                    .scaleEffect(self.isAnimating ? 1.0 : 0.5)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever(autoreverses: true)
                            .delay(0.2 * Double(index)),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            self.isAnimating = true
        }
    }
    
    /// The fill color for the dots.
    private var fillColor: Color {
        let defaultColor = configuration.theme.foreground
        if let contentGradient = configuration.contentGradient {
            return contentGradient.colors.randomElement() ?? defaultColor
        } else {
            return defaultColor
        }
    }
}
