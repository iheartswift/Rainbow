//
//  RainbowBounceAnimationOptions.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import Foundation

/// Configuration for the RainbowBounce animation.
public struct RainbowBounceAnimationOptions {
    
    /// The response time of the spring animation.
    public var response: Double
    
    /// The damping fraction of the spring animation.
    public var dampingFraction: Double
    
    /// The blend duration of the spring animation.
    public var blendDuration: Double
    
    /// The scale effect to apply when the button is pressed.
    public var scaleEffect: CGFloat
    
    /// Initializes a new RainbowConfiguration.
    ///
    /// - Parameters:
    ///   - response: The response time of the spring animation.
    ///   - dampingFraction: The damping fraction of the spring animation.
    ///   - blendDuration: The blend duration of the spring animation.
    ///   - scaleEffect: The scale effect to apply when the button is pressed.
    public init(response: Double, dampingFraction: Double, blendDuration: Double, scaleEffect: CGFloat) {
        self.response = response
        self.dampingFraction = dampingFraction
        self.blendDuration = blendDuration
        self.scaleEffect = scaleEffect
    }
}

// MARK: - Pre-configured bounces

public extension RainbowBounceAnimationOptions {
    
    /// Pre-configured subtle bounce animation.
    static let subtle = RainbowBounceAnimationOptions(
        response: 0.5,
        dampingFraction: 0.7,
        blendDuration: 0.1,
        scaleEffect: 1.1
    )
    
    /// Pre-configured moderate bounce animation.
    static let moderate = RainbowBounceAnimationOptions(
        response: 0.4,
        dampingFraction: 0.6,
        blendDuration: 0.1,
        scaleEffect: 1.2
    )
    
    /// Pre-configured strong bounce animation.
    static let strong = RainbowBounceAnimationOptions(
        response: 0.3,
        dampingFraction: 0.5,
        blendDuration: 0.1,
        scaleEffect: 1.3
    )
}
