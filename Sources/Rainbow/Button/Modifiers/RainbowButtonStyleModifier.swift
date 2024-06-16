//
//  RainbowButtonStyleModifier.swift
//
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// A view modifier that applies a rainbow button style to a view.
///
/// This modifier applies a rainbow button style to a view, with a loading indicator and various customizable options.
struct RainbowButtonStyleModifier: ViewModifier {
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
    func body(content: Content) -> some View {
        ZStack {
            contentView(from: content)
            RainbowLoaderView(configuration: configuration)
                .tint(configuration.theme.foreground)
                .opacity(isLoading ? 1.0 : 0.0)
                #if os(tvOS)
                .scaleEffect(2.0)
                #endif
        }
        .underline(configuration.underline, color: RainbowColorTheme.default.foreground)
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
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                case .roundedRectangle, .rectangle:
                    RoundedRectangle(cornerRadius: configuration.cornerRadius)
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                case .circle:
                    Circle()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                }
            }
        )
        .shadow(color: configuration.shadow.color, radius: configuration.shadow.radius, x: configuration.shadow.x, y: configuration.shadow.y)
    }
    
    /// Creates a `StrokeStyle` from the given configuration.
    ///
    /// - Parameter configuration: The button configuration.
    /// - Returns: A `StrokeStyle` based on the configuration.
    private func strokeStyle(from configuration: RainbowButtonConfiguration) -> StrokeStyle {
        StrokeStyle(
            lineWidth: configuration.border.width,
            dash: configuration.border.dashPattern
        )
    }
    
    /// Runs a continuous animation to cycle through the border colors.
    ///
    /// - Parameter interval: The time interval for the animation.
    private func runAnimation(interval: TimeInterval) {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
            Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % configuration.border.colors.count
                }
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
}
