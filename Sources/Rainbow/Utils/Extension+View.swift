import SwiftUI

public extension View {
    public func rainbowBorder(gradient: LinearGradient, cornerRadius: CGFloat = 0, lineWidth: CGFloat = 1) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(gradient, lineWidth: lineWidth)
        )
    }
    
    public func roundRect(cornerRadius: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    public func pinchToZoom() -> some View {
        self.modifier(PinchToZoom())
    }
    
    @ViewBuilder
    public func pinchToZoom(if condition: Bool) -> some View {
        if condition {
            self.modifier(PinchToZoom())
        } else {
            self
        }
    }
}
