//
//  RainbowCapsuleShapeModifier.swift
//
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A view modifier that applies a rainbow capsule shape to a view.
 
 This modifier applies a capsule shape to a view, with an optional border and background color.
 */
struct RainbowCapsuleShapeModifier: ViewModifier {
    /**
     A Boolean indicating whether to use a capsule shape.
     */
    let useCapsuleShape: Bool
    
    /**
     The background color of the shape.
     */
    let backgroundColor: Color
    
    /**
     The border color of the shape.
     */
    let borderColor: Color
    
    /**
     The border width of the shape.
     */
    let borderWidth: CGFloat
    
    /**
     The content view to apply the modifier to.
     */
    func body(content: Content) -> some View {
        content
            .background(
                Group {
                    if useCapsuleShape {
                        Capsule()
                            .fill(backgroundColor)
                    } else {
                        RoundedRectangle(cornerRadius: 8) // Default corner radius
                            .fill(backgroundColor)
                    }
                }
            )
            .overlay(
                Group {
                    if useCapsuleShape {
                        Capsule()
                            .stroke(borderColor, lineWidth: borderWidth)
                    } else {
                        RoundedRectangle(cornerRadius: 8) // Default corner radius
                            .stroke(borderColor, lineWidth: borderWidth)
                    }
                }
            )
    }
}
