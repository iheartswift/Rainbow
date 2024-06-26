import SwiftUI

/// Extensions to the `View` type to provide rainbow button styling and capsule shaping.
public extension View {
    
    /// Applies a rainbow button style to the view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the rainbow button.
    ///   - size: The size of the rainbow button. Default is `.normal`.
    ///   - inverted: A Boolean indicating whether the button theme should be inverted. Default is `false`.
    ///   - isLoading: A binding to a Boolean indicating whether the button is loading. Default is `false`.
    ///   - action: The action to perform when the button is pressed.
    /// - Returns: A view with the rainbow button style applied.
    func rainbowButton(
        _ configuration: RainbowButtonConfiguration = .default,
        isLoading: Binding<Bool> = .constant(false),
        _ action: @escaping () -> Void
    ) -> some View {
        return self.modifier(RainbowButtonModifier(configuration: configuration, isLoading: isLoading, action: action))
    }
    
    /// Applies an animation to the view.
    ///
    /// - Parameter animation: The animation to apply to the view.
    /// - Returns: A view that applies the specified animation.
    @ViewBuilder
    func withCustomAnimation(_ animation: Animation? = .default) -> some View {
        if let animation = animation {
            self.animation(animation, value: UUID())
        } else {
            self
        }
    }
    
    /// Conditionally applies a transformation to a view.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value that determines whether to apply the transformation.
    ///   - transform: A closure that takes the view as an input and returns a transformed view.
    /// - Returns: The original view or the transformed view based on the condition.
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            return AnyView(transform(self))
        } else {
            return AnyView(self)
        }
    }
}
