//
//  RainbowFocusedOptions.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import SwiftUI

/// A struct that defines the options for a button's appearance when it is focused.
public struct RainbowFocusedOptions {
    
    /// The scale factor to apply to the button when it is focused.
    public let scale: CGFloat
    
    /// The shadow options to apply to the button when it is focused.
    public let shadow: RainbowShadowOptions
    
    /// The scale factor to apply to the loader when the button is focused.
    public let loaderScale: CGFloat
    
    /// The animation
    public let animation: Animation
    
    /// Initializes a new instance of `RainbowFocusedOptions`.
    ///
    /// - Parameters:
    ///   - scale: The scale factor to apply to the button when it is focused. The default value is `1.3`.
    ///   - shadow: The shadow options to apply to the button when it is focused. The default value is an instance of `RainbowShadowOptions`.
    ///   - loaderScale: The scale factor to apply to the loader when the button is focused. The default value is `2.0`.
    public init(
        scale: CGFloat = 1.3,
        shadow: RainbowShadowOptions = RainbowShadowOptions(),
        loaderScale: CGFloat = 2.0,
        animation: Animation = .easeInOut(duration: 0.1)
    ) {
        self.scale = scale
        self.shadow = shadow
        self.loaderScale = loaderScale
        self.animation = animation
    }
}

