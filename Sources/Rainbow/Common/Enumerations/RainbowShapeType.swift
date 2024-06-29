import SwiftUI

/// An enumeration that defines the shape types for a Rainbow components.
public enum RainbowShapeType: Equatable {
    /// A circular button shape.
    case circle
    
    /// A rounded rectangle button shape with an optional corner radius.
    case roundedRectangle(_ cornerRadius: CGFloat? = nil)
    
    /// A rectangular button shape.
    case rectangle
    
    /// A capsule-shaped button.
    case capsule
}


