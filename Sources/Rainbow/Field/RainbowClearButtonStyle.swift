import SwiftUI

/// A button style that removes the background of the button, making it clear.
public struct RainbowClearButtonStyle: ButtonStyle {

    /// Creates an instance of `RainbowClearButtonStyle`.
    public init() {}

    /// Creates a view that represents the body of a button.
    ///
    /// - Parameter configuration: The properties of the button.
    /// - Returns: A view that represents the body of the button with a clear background.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear) // Remove background
    }
}
