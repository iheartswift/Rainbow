import SwiftUI

/// A view modifier that applies a rainbow button style to a view.
public struct RainbowButtonStyleModifier: ViewModifier {
    /// The configuration for the rainbow button.
    let configuration: RainbowButtonConfiguration
    
    /// A binding to a Boolean indicating whether the button is loading.
    @Binding var isLoading: Bool

    /// A state variable indicating whether the button is pressed.
    @State private var isPressed: Bool = false
    
    /// The current index of the border color for the animation.
    @State private var currentIndex = 0
    
    /// State to track focus on tvOS
    #if os(tvOS)
    @FocusState private var isFocused
    #endif
    
    /// The current border color based on the animation index.
    var currentColor: Color {
        configuration.border.colors[currentIndex]
    }

    /// The content view with the applied styles.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: A view with the applied content gradient and opacity based on the loading state.
    @ViewBuilder
    func contentView(from content: Content) -> some View {
        if let contentGradient = configuration.contentGradient {
            content
                .opacity(isLoading ? 0.0 : 1.0)
                .foregroundStyle(contentGradient.gradient)
        } else {
            content
                .opacity(isLoading ? 0.0 : 1.0)
        }
    }

    /// The body of the view modifier.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: A view with the rainbow button style applied.
    public func body(content: Content) -> some View {
        ZStack {
            contentView(from: content)
            RainbowLoaderView(configuration: configuration)
                .tint(configuration.theme.foreground)
                .opacity(isLoading ? 1.0 : 0.0)
                #if os(tvOS)
                .scaleEffect(2.0)
                #endif
        }
        .underline(configuration.underline, color: RainbowButtonColorTheme.default.foreground)
        .font(configuration.size.font)
        .padding(configuration.size.padding)
        .foregroundColor(configuration.theme.foreground)
        .background(
            Group {
                switch configuration.shapeType {
                case .capsule:
                    Capsule()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: currentBorderColors()),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: strokeStyle()
                        )
                case .roundedRectangle(let cornerRadius):
                    RoundedRectangle(cornerRadius: cornerRadius ?? RainbowDefaults.cornerRadius)
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: currentBorderColors()),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: strokeStyle()
                        )
                case .rectangle:
                    Rectangle()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: currentBorderColors()),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: strokeStyle()
                        )
                case .circle:
                    Circle()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: currentBorderColors()),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: strokeStyle()
                        )
                }
            }
        )
        .shadow(color: configuration.shadow.color, radius: configuration.shadow.radius, x: configuration.shadow.x, y: configuration.shadow.y)
        .onAppear {
            startBorderAnimation()
        }
    }
    
    /// Creates a `StrokeStyle` from the given configuration.
    ///
    /// - Parameter configuration: The button configuration.
    /// - Returns: A `StrokeStyle` based on the configuration.
    private func strokeStyle() -> StrokeStyle {
        StrokeStyle(
            lineWidth: configuration.border.width,
            dash: configuration.border.dashPattern
        )
    }
    
    /// Starts a continuous animation to cycle through the border colors.
    private func startBorderAnimation() {
        guard let interval = configuration.border.animationOptions?.interval, interval > 0 else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % configuration.border.colors.count
            }
        }
    }
    
    /// Determines the fill style for the button background.
    ///
    /// - Parameter configuration: The button configuration.
    /// - Returns: A `ShapeStyle` for the button background.
    private func fill(for configuration: RainbowButtonConfiguration) -> some ShapeStyle {
        let standardGradient = LinearGradient(
            colors: [configuration.theme.background],
            startPoint: .leading,
            endPoint: .trailing
        )
        let backgroundGradient = LinearGradient(
            colors: configuration.backgroundGradient?.colors ?? [],
            startPoint: configuration.backgroundGradient?.startPoint ?? .leading,
            endPoint: configuration.backgroundGradient?.endPoint ?? .trailing
        )
        return configuration.backgroundGradient == nil ? standardGradient : backgroundGradient
    }
    
    /// Gets the current border colors for the progress bar.
    ///
    /// - Returns: An array of colors for the border.
    private func currentBorderColors() -> [Color] {
        if let interval = configuration.border.animationOptions?.interval, interval > 0 {
            return [configuration.border.colors[currentIndex % configuration.border.colors.count]]
        }
        return configuration.border.colors
    }
}

