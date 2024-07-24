import SwiftUI

#if canImport(UIKit)
/**
 A `Shape` that allows for rounding specific corners of a rectangle.
 
 - Parameters:
    - corners: The corners to be rounded. Uses `UIRectCorner` to specify which corners should be rounded.
    - radius: The radius of the rounded corners.
 */
public struct RainbowRoundedCorner: Shape {
    public var corners: UIRectCorner
    public var radius: CGFloat
    
    public init(corners: UIRectCorner, radius: CGFloat) {
        self.corners = corners
        self.radius = radius
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
#endif
