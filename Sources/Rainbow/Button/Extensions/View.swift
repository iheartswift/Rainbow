//
//  View.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

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
        _ configuration: RainbowButtonConfiguration,
        _ size: RainbowButtonSize = .normal,
        inverted: Bool = false,
        isLoading: Binding<Bool> = .constant(false),
        _ action: @escaping () -> Void
    ) -> some View {
        return self.modifier(RainbowButtonModifier(configuration: configuration, isLoading: isLoading, action: action))
    }
    
    /// Applies a rainbow button style to the view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the rainbow button.
    ///   - isLoading: A binding to a Boolean indicating whether the button is loading.
    /// - Returns: A view with the rainbow button style applied.
    func rainbowButtonStyle(configuration: RainbowButtonConfiguration, isLoading: Binding<Bool>) -> some View {
        self.modifier(RainbowButtonStyleModifier(configuration: configuration, isLoading: isLoading))
    }
    
    /// Applies the `RainbowBounceModifier` to a view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the bounce animation.
    ///   - isPressed: A Boolean value indicating whether the view is pressed.
    /// - Returns: A view modified with the bounce effect.
    func rainbowBounce(configuration: RainbowButtonConfiguration, isPressed: Bool) -> some View {
        self.modifier(RainbowBounceModifier(configuration: configuration, isPressed: isPressed))
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
}
