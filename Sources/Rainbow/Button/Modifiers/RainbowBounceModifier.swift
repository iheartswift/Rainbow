//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import SwiftUI

/// A ViewModifier that applies a bounce effect using a spring animation.
public struct RainbowBounceModifier: ViewModifier {
    
    var configuration: RainbowButtonConfiguration
    var isPressed: Bool
    
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
