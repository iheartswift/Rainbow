//
//  RainbowShadowOptions.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// A struct representing options for a rainbow shadow.
///
/// A rainbow shadow is a visual effect that can be applied to a view, with a specified color, radius, and offset.
public struct RainbowShadowOptions {
    /// The color of the shadow.
    public var color: Color
    
    /// The radius of the shadow.
    public var radius: CGFloat
    
    /// The x-offset of the shadow.
    public var x: CGFloat
    
    /// The y-offset of the shadow.
    public var y: CGFloat
    
    /// Initializes a new instance of `RainbowShadowOptions` with the specified color, radius, x-offset, and y-offset.
    ///
    /// - Parameters:
    ///   - color: The color of the shadow. Default is `.clear`.
    ///   - radius: The radius of the shadow. Default is `0`.
    ///   - x: The x-offset of the shadow. Default is `0`.
    ///   - y: The y-offset of the shadow. Default is `0`.
    public init(color: Color = .clear, radius: CGFloat = 0, x: CGFloat = 0, y: CGFloat = 0) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

extension RainbowShadowOptions {
    
    public static var `default`: RainbowShadowOptions {
        return RainbowShadowOptions(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}
