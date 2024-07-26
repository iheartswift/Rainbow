import SwiftUI

/// A view modifier that adds a customizable toggle component to a view.
public struct RainbowToggleModifier: ViewModifier {
    /// Configuration for the `RainbowToggle`.
    var configuration: RainbowToggleConfiguration
    
    /// Binding to a boolean value indicating whether the toggle is on or off.
    @Binding var isToggled: Bool

    /// Applies the modifier to a content view.
    /// - Parameter content: The view to which the modifier is applied.
    /// - Returns: A view that contains an `HStack` with a `RainbowToggle` and the original content view.
    public func body(content: Content) -> some View {
        HStack {
            RainbowToggle(configuration: configuration, isToggled: $isToggled)
            content
        }
        .onTapGesture {
            withAnimation(configuration.animation) {
                isToggled.toggle()
            }
        }
    }
}

/// An extension to add a RainbowToggle to any view.
public extension View {
    /// Adds a RainbowToggle to the view.
    /// - Parameters:
    ///   - isChecked: A binding to a Boolean value that determines whether the toggle is checked.
    ///   - configuration: The configuration for the toggle.
    /// - Returns: A view with a RainbowToggle added.
    func rainbowToggle(_ configuration: RainbowToggleConfiguration, isToggled: Binding<Bool>) -> some View {
        self.modifier(RainbowToggleModifier(configuration: configuration, isToggled: isToggled))
    }
}
