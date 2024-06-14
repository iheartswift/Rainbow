//
//  RainbowBorderOptions.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A struct representing options for a rainbow border.
 
 A rainbow border is a border that can be applied to a view, with a specified color and width.
 */
public struct RainbowBorderOptions {
    /**
     The color of the border.
     */
    public var color: Color
    
    /**
     The width of the border.
     */
    public var width: CGFloat
    
    /**
     Initializes a new instance of RainbowBorderOptions with the specified color and width.
     
     - Parameters:
       - color: The color of the border. Default is `.clear`.
       - width: The width of the border. Default is `0`.
     */
    public init(color: Color = .clear, width: CGFloat = 0) {
        self.color = color
        self.width = width
    }
}
