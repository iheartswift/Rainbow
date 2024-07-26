import SwiftUI

public extension Color {
    
    /// Creates a color from the Rainbow module's asset catalog.
    ///
    /// - Parameter name: The name of the color asset.
    /// - Returns: A `Color` instance corresponding to the specified asset name.
    static func rainbowColor(_ name: String) -> Color {
        return Color(name, bundle: Bundle.module)
    }
}
