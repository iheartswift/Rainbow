//
//  RainbowCardButtonFocusedStyle.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import SwiftUI

/// A button style that customizes the appearance of a button based on its focus state.
public struct RainbowCardButtonFocusedStyle: ButtonStyle {
    
    /// The configuration for the button's appearance and behavior.
    public var buttonConfiguration: RainbowButtonConfiguration
    
    /// A Boolean value indicating whether the button is focused.
    public let isFocused: Bool
    
    /// The scale effect to apply to the button when it is focused.
    private var scaleEffect: CGFloat {
        isFocused ? buttonConfiguration.focused.scale : 1.0
    }
    
    /// The shadow color to apply to the button when it is focused.
    private var shadowColor: Color {
        isFocused ? buttonConfiguration.focused.shadow.color : .clear
    }
    
    /// The shadow radius to apply to the button when it is focused.
    private var radius: CGFloat {
        buttonConfiguration.focused.shadow.radius
    }
    
    /// The animation to apply to the button.
    private var animation: Animation {
        buttonConfiguration.focused.animation
    }
    
    /// Creates the view that represents the body of a button.
    ///
    /// - Parameter configuration: The properties of the button.
    /// - Returns: A view that represents the body of a button.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                backgroundShape()
            )
            .scaleEffect(scaleEffect)
            .rainbowBounce(configuration: buttonConfiguration, isPressed: configuration.isPressed)
            .shadow(color: shadowColor, radius: radius)
            .withCustomAnimation(animation)
    }

    /// Returns the appropriate background shape based on the button configuration.
    ///
    /// - Returns: A view representing the background shape of the button.
    @ViewBuilder
    private func backgroundShape() -> some View {
        switch buttonConfiguration.shapeType {
        case .circle:
            Circle()
                .fill(Color.clear)
        case .rectangle:
            Rectangle()
                .fill(Color.clear)
        case .roundedRectangle:
            RoundedRectangle(cornerRadius: buttonConfiguration.cornerRadius)
                .fill(Color.clear)
        case .capsule:
            Capsule()
                .fill(Color.clear)
        }
    }
}
