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
}
