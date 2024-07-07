import SwiftUI

/// Extensions to the `View` type to provide rainbow button styling and capsule shaping.
public extension View {
    
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
