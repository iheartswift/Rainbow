//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import SwiftUI

/// A `ViewModifier` that applies a bounce effect using a spring animation.
public struct RainbowBounceModifier: ViewModifier {
    
    /// The configuration for the button.
    var configuration: RainbowButtonConfiguration
    
    /// A Boolean value indicating whether the view is pressed.
    var isPressed: Bool
    
    /// The body of the view.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: A view with the bounce effect applied if configured.
    public func body(content: Content) -> some View {
        if let b = configuration.bounce {
            content
                .scaleEffect(isPressed ? b.scaleEffect : 1.0)
                .animation(
                    .spring(
                        response: b.response,
                        dampingFraction: b.dampingFraction,
                        blendDuration: b.blendDuration
                    ),
                    value: isPressed
                )
        } else {
            content
        }
    }
}
