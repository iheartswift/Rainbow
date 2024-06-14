//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 Extensions to the View type to provide rainbow button styling and capsule shaping.
 */
extension View {
    /**
     Applies a rainbow button style to the view.
     
     - Parameters:
       - configuration: The configuration for the rainbow button.
       - isLoading: A binding to a Boolean indicating whether the button is loading.
     - Returns: A view with the rainbow button style applied.
     */
    func rainbowButtonStyle(configuration: RainbowButtonConfiguration, isLoading: Binding<Bool>) -> some View {
        self.modifier(RainbowButtonStyleModifier(configuration: configuration, isLoading: isLoading))
    }
    
    /**
     Applies a capsule shape to the view.
     
     - Parameters:
       - useCapsuleShape: A Boolean indicating whether to use a capsule shape.
       - backgroundColor: The background color of the shape.
       - borderColor: The border color of the shape.
       - borderWidth: The border width of the shape.
     - Returns: A view with the capsule shape applied.
     */
    func capsuleShape(
        useCapsuleShape: Bool,
        backgroundColor: Color,
        borderColor: Color,
        borderWidth: CGFloat
    ) -> some View {
        self.modifier(
            RainbowCapsuleShapeModifier(
                useCapsuleShape: useCapsuleShape,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                borderWidth: borderWidth
            )
        )
    }
    
    /**
     Handles the configuration for the rainbow button.
     
     - Parameters:
       - configuration: The configuration for the rainbow button.
       - size: The size of the rainbow button.
       - inverted: A Boolean indicating whether to invert the theme.
       - rounded: A Boolean indicating whether to use a rounded shape.
     - Returns: The updated configuration for the rainbow button.
     */
    private func handle(
        configuration: RainbowButtonConfiguration,
        size: RainbowButtonSize,
        inverted: Bool,
        rounded: Bool
    ) -> RainbowButtonConfiguration {
        var c = inverted ? configuration.invertTheme().update(size) : configuration.update(size)
        c = rounded ? c.capsule() : c
        return c
    }
    
    /**
     Applies a rainbow button style to the view.
     
     - Parameters:
       - configuration: The configuration for the rainbow button.
       - size: The size of the rainbow button. Default is `.normal`.
       - inverted: A Boolean indicating whether to invert the theme. Default is `false`.
       - rounded: A Boolean indicating whether to use a rounded shape. Default is `false`.
       - isLoading: A binding to a Boolean indicating whether the button is loading. Default is `false`.
       - action: The action to perform when the button is pressed.
     - Returns: A view with the rainbow button style applied.
     */
    func rainbowButton(
        _ configuration: RainbowButtonConfiguration,
        _ size: RainbowButtonSize = .normal,
        inverted: Bool = false,
        rounded: Bool = false,
        isLoading: Binding<Bool> = .constant(false),
        _ action: @escaping () -> Void
    ) -> some View {
        let updatedConfiguration = handle(configuration: configuration, size: size, inverted: inverted, rounded: rounded)
        return self.modifier(RainbowButtonModifier(configuration: updatedConfiguration, isLoading: isLoading, action: action))
    }
}
